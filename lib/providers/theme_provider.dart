import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  bool isDark;
  static Color _primaryColor = Colors.indigo;

  ThemeChanger(this.isDark);

  static List<ThemeData> themes = [
    ThemeData(
      brightness: Brightness.light,
      primarySwatch: _primaryColor,
      scaffoldBackgroundColor: Colors.white,
    ),
    ThemeData(
      brightness: Brightness.dark,
      primarySwatch: _primaryColor,
      scaffoldBackgroundColor: Colors.black,
    ),
  ];

  getTheme() => isDark ? themes[1] : themes[0];

  setTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  Color get primaryColor => _primaryColor;
  set primaryColor(payload) {
    _primaryColor = payload;
    notifyListeners();
  }
}
