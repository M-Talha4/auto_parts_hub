import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:auto_parts_hub/domain/db/local_storage/my_prefs.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/language_services/language_services.dart';
import 'package:auto_parts_hub/infrastructure/theme/text_size.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxString selectedLanguage = ''.obs;
  int selectedIndex = 0;
  RxBool isDarkMode =
      (colorScheme(Get.context).brightness == Brightness.dark).obs;

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
    _getLanguage();
    super.onInit();
  }

  void _getLanguage() {
    String? lang = StaticData.language;
    selectedLanguage.value = capitalizeFirstLetter(lang.tr);
    selectedIndex = languages.indexOf(lang);
  }

  void selectLanguage(String language) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.all(20),
      color: colorScheme(Get.context).onPrimary,
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
                          ? colorScheme(context).primary
                          : null,
                      borderRadius: BorderRadius.circular(5)),
                  child: CustomText(
                    text: languages[index].tr,
                    fontSize: AppTextSize.titleSmallFont,
                    color: index == selectedIndex
                        ? colorScheme(context).onPrimary
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

  void darkMode(bool darkMode) {
    isDarkMode.value = darkMode;
    isDarkMode.value
        ? Get.changeThemeMode(ThemeMode.dark)
        : Get.changeThemeMode(ThemeMode.light);
    MyPrefs.storeTheme(isDarkMode: darkMode);
  }

  String capitalizeFirstLetter(String input) {
    return input[0].toUpperCase() + input.substring(1);
  }
}
