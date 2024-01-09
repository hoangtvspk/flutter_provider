import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _mode = ThemeMode.light;
  ThemeMode get mode => _mode;

  // ThemeProvider({
  //   ThemeMode mode = ThemeMode.light,
  // }) : _mode = mode;

  ThemeProvider(bool isDark) {
    _mode = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleMode() async {
    final prefs = await SharedPreferences.getInstance();
    if (_mode == ThemeMode.light) {
      _mode = ThemeMode.dark;
      prefs.setBool('isDark', true);
    } else {
      _mode = ThemeMode.light;
      prefs.setBool('isDark', false);
    }

    notifyListeners();
  }
}
