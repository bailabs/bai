import 'package:bai/create.dart' as create;

void main(List<String> arguments) async {
  print(arguments);
  if (arguments[0] == 'new') {
    await create.create(arguments[1], arguments[1]);
  }
}
