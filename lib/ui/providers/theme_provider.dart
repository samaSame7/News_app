import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  var themeMode = ThemeMode.light;

  bool get isLightMode => themeMode == ThemeMode.light;

  void changeTheme(ThemeMode newMode) {
    themeMode = newMode;
    notifyListeners();
  }
}
