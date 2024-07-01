import '/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '../consts/app_color.dart';
import 'package:get/get.dart';

// showToast({required String message, required bool isError}) {
//   Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: isError ? Colors.red : AppColor.primary,
//       textColor: Colors.white,
//       fontSize: 16.0);
// }

showSnackbar({required String message, bool isError = false}) {
  Get.showSnackbar(GetSnackBar(
    messageText: CustomText(
      text: message,
      color: isError ? AppColor.white : AppColor.black,
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: isError ? Colors.red : AppColor.primaryLight!,
    duration: const Duration(
      seconds: 2,
    ),
    isDismissible: false,
    icon: Icon(
      isError ? Icons.info : Icons.check_circle_sharp,
      color: isError ? AppColor.white : AppColor.black,
    ),
  ));
}
