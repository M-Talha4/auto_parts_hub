import '../../const/const.dart';
import 'package:get_storage/get_storage.dart';

class MyPrefs {
  static final GetStorage _getStorage = GetStorage();

  static Future<void> saveString(
      {required String key, required String value}) async {
    await _getStorage.write(key, value);
  }

  static Future<void> saveBool(
      {required String key, required bool value}) async {
    await _getStorage.write(key, value);
  }

  static dynamic getValue({required String key}) {
    return _getStorage.read(key);
  }

  static storeLanguage({required String language}) {
    _getStorage.write(LANGUAGE, language);
  }

  static storeTheme({required bool isDarkMode}) {
    _getStorage.write(IS_DARK_THEME, isDarkMode);
  }

  static bool? getTheme() {
    return _getStorage.read(IS_DARK_THEME);
  }

  static String? getLanguage() {
    return _getStorage.read(LANGUAGE);
  }

  static removeTheme() {
    _getStorage.remove(IS_DARK_THEME);
  }
}
