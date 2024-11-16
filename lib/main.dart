import 'package:flutter/material.dart';
import 'theme_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemePreferences _preferences = ThemePreferences();
  ThemeMode _themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    String theme = await _preferences.getThemePreference();
    setState(() {
      _themeMode = theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    });
  }

  Future<void> _toggleTheme() async {
    String newTheme = _themeMode == ThemeMode.light ? 'dark' : 'light';
    await _preferences.saveThemePreference(newTheme);
    setState(() {
      _themeMode = newTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Preference Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode, // Use the stored theme mode
      home: Scaffold(
        appBar: AppBar(title: Text('Theme Preference Demo')),
        body: Center(
          child: ElevatedButton(
            onPressed: _toggleTheme,
            child: Text('Toggle Theme'),
          ),
        ),
      ),
    );
  }
}
