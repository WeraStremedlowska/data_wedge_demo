import 'package:data_wedge_demo/src/consts/value_enum.dart';

enum ScannerControlStates with ValueEnum {
  startScanning("START_SCANNING"),
  stopScanning("STOP_SCANNING");

  final String value;

  const ScannerControlStates(this.value);
}
