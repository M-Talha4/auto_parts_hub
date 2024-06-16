import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          controller.imagePath,
          height: 240,
          width: 240,
        ),
      ),
    );
  }
}
