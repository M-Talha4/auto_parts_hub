import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _preferences;

  // Initialize SharedPreferences
  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Set a string value in SharedPreferences
  static Future<void> setString(String key, String value) async {
    if (_preferences == null) {
      await initialize();
    }
    await _preferences!.setString(key, value);
  }

  // Get a string value from SharedPreferences
  static String? getString(String key) {
    if (_preferences == null) {
      return null;
    }
    return _preferences!.getString(key);
  }

  // Remove a value from SharedPreferences
  static Future<void> remove(String key) async {
    if (_preferences == null) {
      await initialize();
    }
    await _preferences!.remove(key);
  }

  // Set a boolean value in SharedPreferences
  static Future<void> setBool(String key, bool value) async {
    if (_preferences == null) {
      await initialize();
    }
    await _preferences!.setBool(key, value);
  }

  // Get a boolean value from SharedPreferences
  static bool? getBool(String key) {
    if (_preferences == null) {
      return null;
    }
    return _preferences!.getBool(key);
  }

  // Set an integer value in SharedPreferences
  static Future<void> setInt(String key, int value) async {
    if (_preferences == null) {
      await initialize();
    }
    await _preferences!.setInt(key, value);
  }

  // Get an integer value from SharedPreferences
  static int? getInt(String key) {
    if (_preferences == null) {
      return null;
    }
    return _preferences!.getInt(key);
  }
}