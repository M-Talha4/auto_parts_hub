import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../generated/locales.generated.dart';
import '../../../domain/db/local_storage/my_prefs.dart';
import '../../../infrastructure/navigation/routes.dart';

class LanguageController extends GetxController {
  late String selectedLanguage;
  late int selectedIndex;
  List<String> languages = [
    LocaleKeys.select_language_english_language,
    LocaleKeys.select_language_arabic_language,
    LocaleKeys.select_language_chinese_language,
    LocaleKeys.select_language_hindi_language,
    LocaleKeys.select_language_japanese_language,
    LocaleKeys.select_language_russian_language,
    LocaleKeys.select_language_spanish_language,
    LocaleKeys.select_language_urdu_language,
  ];

  @override
  void onInit() {
    String? lang = MyPrefs.getLanguage();
    selectedLanguage = capitalizeFirstLetter(
        lang ?? LocaleKeys.select_language_english_language);
    selectedIndex = lang != null ? languages.indexOf(lang) : 0;
    super.onInit();
  }

  void onLanguageSelected(int index) {
    selectedIndex = index;
    selectedLanguage = languages[index];
    if (index == 0) {
      selectedLanguage = LocaleKeys.select_language_english_language;
    }
    switch (selectedLanguage.toLowerCase()) {
      case LocaleKeys.select_language_english_language:
        Get.updateLocale(const Locale('en', 'US'));
      case LocaleKeys.select_language_arabic_language:
        Get.updateLocale(const Locale('ar', 'SA'));
      case LocaleKeys.select_language_chinese_language:
        Get.updateLocale(const Locale('zh', 'CN'));
      case LocaleKeys.select_language_hindi_language:
        Get.updateLocale(const Locale('hi', 'IN'));
      case LocaleKeys.select_language_japanese_language:
        Get.updateLocale(const Locale('ja', 'JP'));
      case LocaleKeys.select_language_russian_language:
        Get.updateLocale(const Locale('ru', 'RU '));
      case LocaleKeys.select_language_spanish_language:
        Get.updateLocale(const Locale('es', 'ES'));
      case LocaleKeys.select_language_urdu_language:
        Get.updateLocale(const Locale('ur', 'PK'));
      default:
        Get.updateLocale(const Locale('en', 'US'));
    }
    update();
  }

  String capitalizeFirstLetter(String input) {
    return input[0].toUpperCase() + input.substring(1);
  }

  void onContinue() {
    MyPrefs.storeLanguage(language: selectedLanguage.toLowerCase());
    Get.offNamed(Routes.LOGIN);
  }
}
