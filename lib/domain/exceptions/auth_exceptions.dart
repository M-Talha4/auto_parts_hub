import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'app_exception.dart';

class AuthExceptions extends AppException {
  AuthExceptions({super.message, super.icon});

  factory AuthExceptions.firebaseExceptions(FirebaseAuthException e) {
    switch (e.code) {
      case "invalid-email":
        return AuthExceptions(
            message:
                LocaleKeys.exception_the_email_address_is_badly_formatted.tr,
            icon: Icons.warning);
      case "invalid-credential":
        return AuthExceptions(
            message: LocaleKeys.exception_invalid_credentials.tr,
            icon: Icons.warning);
      case "weak-password":
        return AuthExceptions(
            message: LocaleKeys
                .exception_password_should_be_at_least_six_characters.tr,
            icon: Icons.lock_open_outlined);
      case "email-already-in-use":
        return AuthExceptions(
            message: LocaleKeys.exception_email_is_already_in_use.tr,
            icon: Icons.warning);
      case "user-disabled":
        return AuthExceptions(
            message: LocaleKeys.exception_this_user_has_been_disabled.tr,
            icon: Icons.do_not_disturb_sharp);
      case "operation-not-allowed":
        return AuthExceptions(
            message: LocaleKeys.exception_operation_not_allowed.tr,
            icon: Icons.not_interested_sharp);
      case "channel-error":
        return AuthExceptions(
            message: LocaleKeys.exception_error_signing_in.tr,
            icon: Icons.error_outline);

      default:
        return AuthExceptions(
            message: LocaleKeys.exception_an_unknown_error_occurred.tr,
            icon: Icons.error);
    }
  }
}
