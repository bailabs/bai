import 'dart:io';

import 'package:bai/create.dart' as create;

bool isDirectoryExist(dirName) {
  return FileSystemEntity.typeSync(dirName) != FileSystemEntityType.notFound;
}

void main(List<String> arguments) async {
  print(arguments);
  if (arguments[0] == 'create') {
    if (!isDirectoryExist(arguments[1])) {
      if (await create.create(arguments[1], arguments[1]) != 0) {
        print('Error downloading template');
        exit(0);
      }
    } else {
      print('App already exist');
    }
  }
}
