import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Theme_Controller extends ChangeNotifier {
  bool _isDark = false;

  late SharedPreferences preferences;

  Theme_Controller({required this.preferences});

  get getTheme {
    _isDark = preferences.getBool('theme') ?? false;

    return _isDark;
  }

  void change_Theme() {
    _isDark = !_isDark;
    preferences.setBool('theme', _isDark);
    notifyListeners();
  }
}
