import 'dart:async';
import '/consts/const.dart';
import '/utils/sharepreference_helper.dart';

import '/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  String? language = SharedPreferencesHelper.getString(spLanguage);
  String? userId = SharedPreferencesHelper.getString(spUserID);
  @override
  void onInit() {
    if (language == null) {
      Timer(const Duration(seconds: 3),
          () => Get.offNamed(Routes.SELECT_LANGUAGE));
    } else if (userId == null) {
      Timer(const Duration(seconds: 3), () => Get.offNamed(Routes.LOGIN));
    } else {
      Timer(const Duration(seconds: 3), () => Get.offNamed(Routes.DASHBOARD));
    }
    super.onInit();
  }
}
