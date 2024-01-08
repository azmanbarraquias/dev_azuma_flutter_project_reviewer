import 'package:flutter/foundation.dart';

class PrintX {
  PrintX(String? title, {String? content}) {
    if (kDebugMode) {
      print('Azman> $title ${content ?? ''}');
    }
  }
}
