import 'package:flutter/foundation.dart';

class Logger {
  static const bool _debug = kDebugMode;

  static void v(Object o) {
    if (_debug) {
      print(o);
    }
  }
}
