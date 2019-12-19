import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:recase/recase.dart';

Future<bool> generatePage(String name) async {
  var rc = ReCase(name);
  var pageNameSmall = rc.snakeCase;

  var dir = Directory('lib/template/page/');
  var entries = dir.listSync(recursive: false).toList();
  for (File entry in entries) {
    var filename = basenameWithoutExtension(entry.path);
    var content = await entry.readAsString();
    var content1 = content.replaceAll('{pageName}', name);
    var content2 = content1.replaceAll('{pageNameSmall}', pageNameSmall);
    await File(pageNameSmall + '_${filename}' + '.dart')
        .writeAsString(content2);
  }
  return true;
}
