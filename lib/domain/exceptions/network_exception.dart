import '/generated/locales.generated.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'app_exception.dart';

class NetworkException extends AppException {
  NetworkException({super.message, super.icon});

  factory NetworkException.connectionError(String error) {
    return NetworkException(
        message: LocaleKeys.exception_network_connection_error.tr,
        icon: Icons.wifi_off);
  }
}
