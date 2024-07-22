import 'package:flutter/material.dart';

class AppException implements Exception {
  String? message;
  IconData? icon;
  AppException({this.message, this.icon});
}
