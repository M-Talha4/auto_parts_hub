import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../generated/locales.generated.dart';

class Validation {
  static String? fieldvalidation(String? value, String field) {
    if (value!.isEmpty) {
      return '${LocaleKeys.validation_please.tr} $field';
    }
    return null;
  }

  static String? emaiValidation(String? value) {
    String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!.trim())) {
      return LocaleKeys.validation_enter_a_valid_email_address.tr;
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return LocaleKeys.validation_please_enter_a_password.tr;
    }
    if (value.length < 6) {
      return LocaleKeys.validation_password_must_be_at_least_six_characters.tr;
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return LocaleKeys
          .validation_password_must_contain_at_least_one_uppercase_letter.tr;
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return LocaleKeys
          .validation_password_must_contain_at_least_one_lowercase_letter.tr;
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return LocaleKeys.validation_password_must_contain_at_least_one_digit.tr;
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return LocaleKeys
          .validation_password_must_contain_at_least_one_special_character.tr;
    }
    return null;
  }

  static String? confirmPassword(String? value, String confirm) {
    RegExp regex = RegExp(r'^(?=.*).{6,}$');
    if (value != confirm) {
      return LocaleKeys.validation_passwords_dont_match.tr;
    } else if (!regex.hasMatch(value!)) {
      return LocaleKeys.validation_must_have_at_least_six_characters.tr;
    } else {
      return null;
    }
  }

  static String? phoneNumberValidation(String? value) {
    if (value!.isEmpty) {
      return LocaleKeys.validation_please_enter_a_phone_number.tr;
    }
    RegExp regex = RegExp(r'^\+\d{1,3}\d{10,14}$');
    if (!regex.hasMatch(value)) {
      return LocaleKeys
          .validation_invalid_phone_number_format_please_include_country_code_starting_with_plus
          .tr;
    }
    return null;
  }

  static String? cardNumberValidation(String? value) {
    if (value!.isEmpty) {
      return LocaleKeys.validation_please_enter_a_card_number.tr;
    }
    RegExp regex = RegExp(r'^\d{4}\s\d{4}\s\d{4}\s\d{4}$');
    if (!regex.hasMatch(value)) {
      return LocaleKeys.validation_enter_a_valid_card_number.tr;
    }
    return null;
  }

  static String? expiryDateValidation(String? value) {
    if (value!.isEmpty) {
      return LocaleKeys.validation_please_enter_an_expiry_date.tr;
    }
    RegExp regex = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');
    if (!regex.hasMatch(value)) {
      return LocaleKeys.validation_enter_a_valid_expiry_date_in_MM_YY_format.tr;
    }
    return null;
  }

  static String? cvvValidation(String? value) {
    if (value!.isEmpty) {
      return LocaleKeys.validation_please_enter_a_CVV_number.tr;
    }
    RegExp regex = RegExp(r'^\d{3}$');
    if (!regex.hasMatch(value)) {
      return LocaleKeys.validation_enter_a_valid_three_digit_CVV_number.tr;
    }
    return null;
  }
}
