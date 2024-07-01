import '/utils/sharepreference_helper.dart';
import '/app/routes/app_pages.dart';
import '/consts/const.dart';
import 'package:get/get.dart';

class SelectLanguageController extends GetxController {
  RxString selectedLanguage = englishLanguge.obs;
  RxInt selectedIndex = 0.obs;
  List<String> languages = [
    englishDefaultLanguge,
    arabicLanguge,
    chineseLanguge,
    englishLanguge,
    hindiLanguge,
    japaneseLanguge,
    russianLanguge,
    spanishLanguge,
    urduLanguge,
  ];
  void onLanguageSelected(int index) {
    selectedIndex.value = index;
    selectedLanguage.value = languages[index];
    if (index == 0) {
      selectedLanguage.value = englishLanguge;
    }
  }

  void onContinue() {
    SharedPreferencesHelper.setString(
            spLanguage, selectedLanguage.value.toLowerCase())
        .then((value) => Get.offNamed(Routes.LOGIN));
  }
}
