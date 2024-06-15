import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import '../consts/app_color.dart';
import 'package:get/get.dart';

showToast({required String message, required bool isError}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? Colors.red : AppColor.primary,
      textColor: Colors.white,
      fontSize: 16.0);
}

showsnackbar({required String message, required bool isError}) {
  Get.showSnackbar(GetSnackBar(
    message: message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: isError ? Colors.red : AppColor.primary,
    duration: const Duration(
      seconds: 2,
    ),
    isDismissible: false,
    // ignore: prefer_const_constructors
    icon: Icon(
      isError ? Icons.info : Icons.check_circle_sharp,
      color: AppColor.white,
    ),
  ));
}
