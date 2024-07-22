import 'package:get/get.dart';

import '../../../../../presentation/language/controllers/language.controller.dart';

class LanguageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(
      () => LanguageController(),
    );
  }
}
