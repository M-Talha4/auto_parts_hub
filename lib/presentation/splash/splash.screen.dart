import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../domain/const/assets_paths.dart';
import 'controllers/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Get.theme.brightness == Brightness.dark
              ? ImagePath.appLogoDark
              : ImagePath.appLogoLight,
          height: 240,
          width: 240,
        ),
      ),
    );
  }
}
