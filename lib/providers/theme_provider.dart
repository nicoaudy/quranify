import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  bool isDark;

  ThemeChanger(this.isDark);

  static List<ThemeData> themes = [
    ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.indigo,
      scaffoldBackgroundColor: Colors.white,
    ),
    ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.indigo,
      scaffoldBackgroundColor: Colors.black,
    ),
  ];

  getTheme() => isDark ? themes[1] : themes[0];

  setTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
