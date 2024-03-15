import 'package:data_wedge_demo/src/consts/value_enum.dart';

enum EmptyCommand with ValueEnum {
  empty('');

  final String value;

  const EmptyCommand(this.value);
}
