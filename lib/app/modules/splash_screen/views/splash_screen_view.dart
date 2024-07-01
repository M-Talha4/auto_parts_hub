import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/consts/assets_paths.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImagePath.appLogo,
          height: 240,
          width: 240,
        ),
      ),
    );
  }
}
