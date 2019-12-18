import 'dart:io';

Future<int> create(String dirName, String appName) async {
  var gitClone = await Process.run('git',
      ['clone', 'https://github.com/bailabs/clean_template.git', dirName]);

  var fileNames = [
    '${dirName}/android/app/src/main/AndroidManifest.xml',
    '${dirName}/ios/Runner/Info.plist',
    '${dirName}/lib/main.dart'
  ];
  for (var fileName in fileNames) {
    changeAppName(fileName, appName);
  }
  return gitClone.exitCode;
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
