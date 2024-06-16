import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;
  var hidePassword = true.obs;
  var hideConfirmPassword = true.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void showPassword() {
    hidePassword.value = !hidePassword.value;
  }

  void showConfirmPassword() {
    hideConfirmPassword.value = !hideConfirmPassword.value;
  }

  void signUp() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      Timer(const Duration(seconds: 2), () {
        isLoading.value == false;
        Get.offAllNamed(Routes.HOME);
      });
    }
  }
}
