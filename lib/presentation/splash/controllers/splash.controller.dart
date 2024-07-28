import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_parts_hub/domain/core/usecase/user_config_usecase/user_config_usecase.dart';
import 'package:auto_parts_hub/infrastructure/navigation/routes.dart';

class SplashController extends GetxController {
  final UserConfigUsecase _userConfigUsecase;
  SplashController(this._userConfigUsecase);

  bool isDarkMode = (Get.theme.brightness == Brightness.dark);
  @override
  onInit() {
    getUserConfig();
    super.onInit();
  }

  Future<void> getUserConfig() async {
    var userConfig = await _userConfigUsecase.execute();
    Timer(const Duration(seconds: 2), () {
      if (userConfig.language == null) {
        Get.offNamed(Routes.LANGUAGE);
      } else if (userConfig.user != null) {
        userConfig.isAdmin == true
            ? Get.offNamed(Routes.ADMIN_PANEL)
            : Get.offNamed(Routes.HOME);
      } else {
        Get.offNamed(Routes.LOGIN);
      }
    });
  }
}
