import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;

  Future<ThemeMode> getThemeMode() async {
    prefs = await _prefs;
    switch(prefs.get('ThemeMode')){
      case "dark":
        return ThemeMode.dark;
      case "light":
        return ThemeMode.light;
    }
    return ThemeMode.dark;
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    //final SharedPreferences prefs = await _prefs;
    String newThemeStr;

    switch (theme) {
      case ThemeMode.system:
        newThemeStr = "dark";
        break;
      case ThemeMode.light:
        newThemeStr = "light";
        break;
      case ThemeMode.dark:
        newThemeStr = "dark";
        break;
    }

    prefs.setString("ThemeMode", newThemeStr);
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
  }
}
