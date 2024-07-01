import 'dart:async';

import '/consts/const.dart';

import '../../../../../routes/app_pages.dart';
import '/utils/toast.dart';
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
    if (formKey.currentState!.validate()) {}
    isLoading.value = true;
    Timer(const Duration(seconds: 2), () {
      isLoading.value == false;
      showSnackbar(
        message: loggedInSuccessfullyText,
      );
      Get.offAllNamed(Routes.DASHBOARD);
    });
  }
}
