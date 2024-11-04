import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String language = "en";

  SettingsProvider() {
    loadSettings();
  }

  void changeTheme(ThemeMode newTheme) async {
    if (newTheme == themeMode) return;
    themeMode = newTheme;
    notifyListeners();
    await saveThemeMode(newTheme);
  }


  void changeLanguage(String newLanguage) async {
    if (language == newLanguage) return;
    language = newLanguage;
    notifyListeners();
    await saveLanguage(newLanguage);
  }

  Future<void> saveThemeMode(ThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', theme == ThemeMode.light ? 'light' : 'dark');
  }

  Future<void> saveLanguage(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', lang);
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString('themeMode') ?? 'light';
    themeMode = themeString == 'light' ? ThemeMode.light : ThemeMode.dark;

    language = prefs.getString('language') ?? 'en';
    notifyListeners();
  }
}
