import 'package:bai/create.dart' as create;
import 'package:bai/page.dart';
import 'package:recase/recase.dart';

String generateName(String name) {
  var rc = ReCase(name);
  return rc.titleCase.replaceAll(' ', '');
}

void main(List<String> arguments) async {
  var command = arguments[0].trim();
  if (command == 'new') {
    await create.create(arguments[1], arguments[1]);
  } else if (command == 'g') {
    var action = arguments[1].trim();
    if (action == 'page') {
      var pageName = generateName(arguments[2].trim());
      await generatePage(pageName);
    }
  }
}
