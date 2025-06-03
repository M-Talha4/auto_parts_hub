import '/generated/locales.generated.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'app_exception.dart';

class RequestTimeoutException extends AppException {
  RequestTimeoutException({super.message, super.icon});

  factory RequestTimeoutException.timeOut(String error) {
    return RequestTimeoutException(
        message: LocaleKeys.exception_request_timed_out.tr,
        icon: Icons.timer_off_outlined);
  }
}
