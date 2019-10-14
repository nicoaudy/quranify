import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  bool isDark;

  ThemeChanger(this.isDark);

  getTheme() => isDark ? ThemeData.dark() : ThemeData.light();

  setTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
