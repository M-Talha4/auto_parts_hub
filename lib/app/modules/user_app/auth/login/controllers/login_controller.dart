import 'dart:async';

import '/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var hidePassword = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void showPassword() {
    hidePassword.value = !hidePassword.value;
  }

  void login() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      Timer(const Duration(seconds: 2), () {
        isLoading.value == false;
        Get.offAllNamed(Routes.HOME);
      });
    }
  }
}
