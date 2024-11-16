import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const _themeKey = 'theme';

  // Function to save the user's theme preference
  Future<void> saveThemePreference(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, theme);
  }

  // Function to retrieve the user's theme preference
  Future<String> getThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeKey) ?? 'light'; // Default to 'light'
  }
}
