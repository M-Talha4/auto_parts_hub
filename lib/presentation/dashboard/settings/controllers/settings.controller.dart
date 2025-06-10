import '../../../../infrastructure/dal/services/firebase_services/user_services.dart';
import '/domain/utils/context_extensions.dart';
import '/domain/db/local_storage/my_prefs.dart';
import '/generated/locales.generated.dart';
import '/infrastructure/dal/services/language_services/language_services.dart';
import '/infrastructure/theme/text_size.dart';
import '/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxString selectedLanguage = ''.obs;
  int selectedIndex = 0;
  RxBool isDarkMode =
      (Get.context?.colorScheme.brightness == Brightness.dark).obs;
  RxString selectedTheme = ''.obs;

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
  List<String> themeModes = [
    LocaleKeys.settings_theme_mode_system_text,
    LocaleKeys.settings_theme_mode_light_text,
    LocaleKeys.settings_theme_mode_dark_text,
  ];

  @override
  void onInit() {
    _getLanguage();
    _getTheme();
    super.onInit();
  }

  void _getLanguage() {
    String? lang = Get.find<UserServices>().user.value.language;
    selectedLanguage.value = capitalizeFirstLetter(lang.tr);
    selectedIndex = languages.indexOf(lang);
  }

  void _getTheme() {
    bool? isDarkMode = MyPrefs.getTheme();
    if (isDarkMode == null) {
      selectedTheme.value = LocaleKeys.settings_theme_mode_system_text;
    } else if (isDarkMode) {
      selectedTheme.value = LocaleKeys.settings_theme_mode_dark_text;
    } else {
      selectedTheme.value = LocaleKeys.settings_theme_mode_light_text;
    }
  }

  void selectLanguage(String language) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.all(20),
      color: Get.context?.colorScheme.onPrimary,
      child: Column(
        children: [
          CustomText(
            text: LocaleKeys.select_language_select_a_language.tr,
            fontSize: AppTextSize.titleSmallFont,
          ),
          Flexible(
            child: ListView.separated(
              itemCount: languages.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => InkWell(
                onTap: () => onLanguageSelected(index),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      color: index == selectedIndex
                          ? context.colorScheme.primary
                          : null,
                      borderRadius: BorderRadius.circular(5)),
                  child: CustomText(
                    text: languages[index].tr,
                    fontSize: AppTextSize.titleSmallFont,
                    color: index == selectedIndex
                        ? context.colorScheme.onPrimary
                        : null,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void onLanguageSelected(int index) {
    selectedIndex = index;
    selectedLanguage.value = languages[index];
    if (index == 0) {
      selectedLanguage.value = LocaleKeys.select_language_english_language;
    }
    Locale locale =
        LanguageServices.instance.onLanguageSelected(selectedLanguage.value);
    Get.updateLocale(locale);
    MyPrefs.storeLanguage(language: selectedLanguage.value);
    Get.back();
  }

  void selectTheme(String themeMode) {
    switch (themeMode) {
      case LocaleKeys.settings_theme_mode_dark_text:
        Get.changeThemeMode(ThemeMode.dark);
        MyPrefs.storeTheme(isDarkMode: true);
        selectedTheme.value = themeMode;
        break;

      case LocaleKeys.settings_theme_mode_light_text:
        Get.changeThemeMode(ThemeMode.light);
        MyPrefs.storeTheme(isDarkMode: false);
        selectedTheme.value = themeMode;
        break;

      default:
        Get.changeThemeMode(ThemeMode.system);
        MyPrefs.removeTheme();
        selectedTheme.value = themeMode;
    }
  }

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }
}
