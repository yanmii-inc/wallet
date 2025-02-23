import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static Future<void> saveString(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  static Future<String> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key) ?? '';
  }

  static Future<void> saveInt(String key, int value) async {
    final prefs = await _prefs;
    await prefs.setInt(key, value);
  }

  static Future<int> getInt(String key) async {
    final prefs = await _prefs;
    return prefs.getInt(key) ?? 0;
  }

  static Future<void> saveBool(String key, bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    final prefs = await _prefs;
    return prefs.getBool(key) ?? false;
  }

  static Future<void> remove(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }

  static Future<void> clear() async {
    final prefs = await _prefs;
    await prefs.clear();
  }
}
