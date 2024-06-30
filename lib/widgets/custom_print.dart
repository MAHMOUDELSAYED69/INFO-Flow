import 'package:flutter/foundation.dart';

class Console {
  Console._();
  static log(Object? data, {String? title = "log:"}) {
    if (kDebugMode) {
      log(data.toString(), title: title ?? "");
      debugPrint("$title ${data.toString()}");
    }
  }
}
