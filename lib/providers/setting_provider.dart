import 'package:flutter/foundation.dart';

class SettingProvider with ChangeNotifier {
  static double _arabSize = 0.5;
  static bool _tafsir = false;

  set arabSize(payload) {
    _arabSize = payload;
    notifyListeners();
  }

  double get arabSize => _arabSize * 40;
  double get sliderArabSize => _arabSize;

  set tafsir(payload) {
    _tafsir = payload;
    notifyListeners();
  }

  bool get tafsir => _tafsir;
}
