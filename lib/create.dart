import 'dart:io';

bool isDirectoryExist(dirName) {
  return FileSystemEntity.typeSync(dirName) != FileSystemEntityType.notFound;
}

Future<bool> create(String dirName, String appName) async {
  if (isDirectoryExist(dirName)) {
    print('${dirName} app already exist');
  }
  var gitClone = await Process.run('git',
      ['clone', 'https://github.com/bailabs/clean_template.git', dirName]);

  if (gitClone.exitCode != 0) {
    print('Error downloading template');
  }

  var fileNames = [
    '${dirName}/android/app/src/main/AndroidManifest.xml',
    '${dirName}/ios/Runner/Info.plist',
    '${dirName}/lib/main.dart'
  ];

  for (var fileName in fileNames) {
    await changeAppName(fileName, appName);
  }

  await Directory('${dirName}/.git').delete(recursive: true);
  Directory.current = Directory('${dirName}/');
  var pubGet = await Process.run('flutter', ['pub', 'get']);

  if (pubGet.exitCode != 0) {
    print('Error updating packages');
  }

  return gitClone.exitCode != 0 && pubGet.exitCode != 0;
}

void changeAppName(fileName, appName) async {
  var file = File(fileName);
  String contents;
  if (await file.exists()) {
    contents = await file.readAsString();
    var newContent = contents.replaceAll('{clean_template}', appName);
    await File(fileName).writeAsString(newContent);
  }
}
