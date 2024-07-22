import 'dart:ui';
import '../../../../generated/locales.generated.dart';

class LanguageServices {
  LanguageServices._();
  static final LanguageServices instance = LanguageServices._();

  factory LanguageServices() {
    return instance;
  }

  Locale onLanguageSelected(String selectedLanguage) {
    switch (selectedLanguage.toLowerCase()) {
      case LocaleKeys.select_language_english_language:
        return const Locale('en', 'US');
      case LocaleKeys.select_language_arabic_language:
        return const Locale('ar', 'SA');
      case LocaleKeys.select_language_chinese_language:
        return const Locale('zh', 'CN');
      case LocaleKeys.select_language_hindi_language:
        return const Locale('hi', 'IN');
      case LocaleKeys.select_language_japanese_language:
        return const Locale('ja', 'JP');
      case LocaleKeys.select_language_russian_language:
        return const Locale('ru', 'RU ');
      case LocaleKeys.select_language_spanish_language:
        return const Locale('es', 'ES');
      case LocaleKeys.select_language_urdu_language:
        return const Locale('ur', 'PK');
      default:
        return const Locale('en', 'US');
    }
  }
}
