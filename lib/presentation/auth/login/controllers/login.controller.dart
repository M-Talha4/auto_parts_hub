import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:auto_parts_hub/domain/utils/logger.dart';
import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:auto_parts_hub/domain/utils/loading_mixin.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/domain/utils/custom_snackbar.dart';
import 'package:auto_parts_hub/domain/exceptions/app_exception.dart';
import 'package:auto_parts_hub/infrastructure/navigation/routes.dart';
import 'package:auto_parts_hub/domain/core/usecase/auth_usecase/login_usecase.dart';

class LoginController extends GetxController with LoadingMixin {
  final LoginUsecase _loginUsecase;
  LoginController(this._loginUsecase);
  RxBool hidePassword = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxList<bool> errorBools = List.generate(5, (index) => false).obs;

  void showPassword() {
    hidePassword.value = !hidePassword.value;
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      setLoading(true);
      try {
        await _loginUsecase.execute(
          emailController.text.trim().toString(),
          passwordController.text.trim().toString(),
        );
        _clearFields();
        showSnackbar(
          message: LocaleKeys.auth_logged_in_successfully_text.tr,
        );
        Timer(
          const Duration(milliseconds: 800),
          () {
            if (StaticData.isAdmin) {
              Get.offNamed(Routes.ADMIN_PANEL);
            } else {
              Get.offNamed(Routes.HOME);
            }
          },
        );
      } catch (e) {
        if (e is AppException) {
          showSnackbar(message: e.message!, icon: e.icon, isError: true);
        }
        if (e.toString() == 'User has been deleted by Admin!') {
          showSnackbar(
              message: LocaleKeys.exception_you_have_been_banned.tr,
              isError: true);
        }
        Logger.e(e.toString());
      }
      setLoading(false);
    }
  }

  void _clearFields() {
    emailController.clear();
    passwordController.clear();
  }
}
