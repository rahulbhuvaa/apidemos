import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setStringValue({required String key, required String value}) {
    return prefs.setString(key, value);
  }

  static String getStringValue(String key) {
    return prefs.getString(key) ?? "";
  }

  static Future<bool>? removeStringValue({required String key}) {
    return prefs.remove(key);
  }

  static setBoolValue({required String key, required bool value}) {
    return prefs.setBool(key, value) ;
  }

  static bool getBoolValue(String key) {
    return prefs.getBool(key) ?? false;
  }

  static clearPrefs() async {
    await prefs.clear();
  }

  static clearStringValue(String key) {
    prefs.remove(key);
  }
}
