import 'dart:async';
import '/consts/assets_paths.dart';

import '/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(
        const Duration(seconds: 3), () => Get.offNamed(Routes.SELECT_LANGUAGE));
    super.onInit();
  }

  String imagePath = ImagePath.appLogo;
}
