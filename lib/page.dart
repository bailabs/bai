import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

final _dartfmt = DartFormatter();

String test1() {
  final animal = Class((b) => b
    ..name = 'Animal'
    ..extend = refer('Organism')
    ..methods.add(Method.returnsVoid((b) => b
      ..name = 'eat'
      ..annotations
      ..body = const Code("print('Yum');"))));
  final emitter = DartEmitter();
  return DartFormatter().format('${animal.accept(emitter)}');
}
