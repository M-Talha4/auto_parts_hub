import 'package:auto_parts_hub/domain/core/usecase/auth_usecase/forget_password_usecase.dart';
import 'package:auto_parts_hub/domain/exceptions/auth_exceptions.dart';
import 'package:auto_parts_hub/domain/utils/custom_snackbar.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/domain/utils/loading_mixin.dart';
import 'package:auto_parts_hub/domain/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class ForgetPasswordController extends GetxController with LoadingMixin {
  final ForgetPasswordUsecase _forgetPasswordUsecase;
  ForgetPasswordController(this._forgetPasswordUsecase);
  var hidePassword = true.obs;
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void resetPassword() async {
    if (formKey.currentState!.validate()) {
      setLoading(true);
      try {
        await _forgetPasswordUsecase
            .execute(emailController.text.trim().toString());
        _clearFields();
        Timer(const Duration(milliseconds: 800), () => Get.back());
        showSnackbar(
          message: LocaleKeys.auth_email_sent_text.tr,
        );
      } catch (e) {
        if (e is AuthExceptions) {
          showSnackbar(message: e.message!, icon: e.icon, isError: true);
        } else {
          Logger.e(e.toString());
        }
      }
      setLoading(false);
    }
  }

  void _clearFields() {
    emailController.clear();
  }
}
