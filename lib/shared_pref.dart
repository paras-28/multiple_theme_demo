import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKey {
  //loginButton

  static const String selectedTheme = 'selectedTheme';
}

class PreferenceManager {
  PreferenceManager._();

  static late SharedPreferences _prefs;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async =>
      _prefs = await SharedPreferences.getInstance();

  static Future<bool> setString(String key, String value) async =>
      _prefs.setString(key, value);

  static String? getString(String key) => _prefs.getString(key);
}
