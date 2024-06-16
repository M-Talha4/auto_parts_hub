import '/app/routes/app_pages.dart';
import '/consts/const.dart';
import 'package:get/get.dart';

class SelectLanguageController extends GetxController {
  var selectedLanguage = selectALanguge.obs;
  List<String> languages = [
    selectALanguge,
    arabicLanguge,
    chineseLanguge,
    englishLanguge,
    hindiLanguge,
    japaneseLanguge,
    russianLanguge,
    spanishLanguge,
    urduLanguge,
  ];
  void onContinue() {
    if (selectedLanguage.value != selectALanguge) {
      print('object');
      Get.offNamed(Routes.LOGIN);
    } else {
      print('abx');
    }
  }
}
