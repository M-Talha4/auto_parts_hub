import '../consts/const.dart';
import '/utils/sharepreference_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  // final _box = GetStorage();

  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  bool _loadTheme() => SharedPreferencesHelper.getBool(IS_DARK_MODE) ?? false;

  void saveTheme(bool isDarkMode) =>
      SharedPreferencesHelper.setBool(IS_DARK_MODE, isDarkMode);

  void changeTheme(ThemeData theme) => Get.changeTheme(theme);

  changeThemeMode(ThemeMode themeMode) {
    Get.changeThemeMode(themeMode);

    ///for ThemeMode.system
    return ThemeMode.system;
  }
}
