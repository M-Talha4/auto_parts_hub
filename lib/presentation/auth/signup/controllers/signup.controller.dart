import 'package:auto_parts_hub/domain/core/usecase/auth_usecase/signup_usecase.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/user_models/user_model.dart';
import 'package:auto_parts_hub/infrastructure/navigation/routes.dart';
import 'package:auto_parts_hub/domain/exceptions/app_exception.dart';
import 'package:auto_parts_hub/domain/utils/custom_snackbar.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/domain/utils/loading_mixin.dart';
import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:auto_parts_hub/domain/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SignupController extends GetxController with LoadingMixin {
  final SignupUsecase _signupUsecase;
  SignupController(this._signupUsecase);
  var hidePassword = true.obs;
  var hideConfirmPassword = true.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void showPassword() {
    hidePassword.value = !hidePassword.value;
  }

  void showConfirmPassword() {
    hideConfirmPassword.value = !hideConfirmPassword.value;
  }

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      setLoading(true);
      UserModel user = UserModel(
        userId: StaticData.userId,
        name: nameController.text.trim().toString(),
        email: emailController.text.trim().toString(),
        phoneNo: phoneNoController.text.trim().toString(),
        isAdmin: false,
        language: StaticData.language,
        profileImage: StaticData.profileImage,
      );
      try {
        await _signupUsecase.execute(
            user, passwordController.text.trim().toString());
        _clearFields();
        showSnackbar(
          message: LocaleKeys.auth_signed_up_successfully_text.tr,
        );
        Timer(const Duration(milliseconds: 800), () {
          if (StaticData.isAdmin) {
            Get.offNamed(Routes.ADMIN_PANEL);
          } else {
            Get.offNamed(Routes.HOME);
          }
        });
      } catch (e) {
        if (e is AppException) {
          showSnackbar(message: e.message!, icon: e.icon, isError: true);
        } else {
          Logger.e(e.toString());
        }
      }
    }
    setLoading(false);
  }

  void _clearFields() {
    nameController.clear();
    emailController.clear();
    phoneNoController.clear();
    passwordController.clear();
    confPasswordController.clear();
  }
}
