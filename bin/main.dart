import 'package:bai/create.dart' as create;

void main(List<String> arguments) async {
  var command = arguments[0].trim();
  if (command == 'new') {
    await create.create(arguments[1], arguments[1]);
  } else if (command == 'g') {}
}
