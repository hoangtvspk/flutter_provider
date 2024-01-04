part of 'extension.dart';

extension IntExt on int {
  bool get toBool {
    return this == 1 ? true : false;
  }
}

extension BoolExt on bool {
  int get toInt {
    return this ? 1 : 0;
  }
}
