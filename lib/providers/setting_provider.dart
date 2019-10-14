import 'package:flutter/foundation.dart';

class SettingProvider with ChangeNotifier {
  static double _arabSize = 0.5;

  set arabSize(payload) {
    _arabSize = payload;
    notifyListeners();
  }

  double get arabSize => _arabSize * 40;
  double get sliderArabSize => _arabSize;
}
