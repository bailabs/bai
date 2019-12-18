import 'dart:io';

Future<String> create() async {
  return await Process.run(
          'git', ['clone', 'https://github.com/bailabs/clean_template.git'])
      .toString();
}
