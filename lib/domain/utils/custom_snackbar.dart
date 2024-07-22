import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../const/global_variable.dart';
import '../../infrastructure/theme/text_size.dart';
import '../../presentation/widgets/custom_text.dart';

void showSnackbar({
  VoidCallback? onPressed,
  required String message,
  IconData? icon,
  Color? backgroundColor,
  String? label,
  bool isError = false,
  bool closeButton = false,
  double overflowThreshold = 1.0,
  bool longActionLabel = false,
  bool floatingType = true,
  bool longLength = false,
}) {
  final SnackBarAction? snackBarAction = label != null
      ? SnackBarAction(
          label: longActionLabel ? "" : label,
          onPressed: onPressed ?? () {},
        )
      : null;
  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(
          isError
              ? icon ?? Icons.warning_amber_rounded
              : Icons.done_all_rounded,
          size: 25,
          color: Colors.white,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: CustomText(
            text: message,
            textAlign: TextAlign.start,
            fontSize: AppTextSize.labelLargeFont,
            color: Colors.white,
          ),
        ),
      ],
    ),
    showCloseIcon: closeButton,
    closeIconColor: Colors.white,
    width: scaffoldMessengerKey.currentContext!.width * 0.95,
    behavior: floatingType ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
    action: snackBarAction,
    duration: Duration(seconds: !longLength ? 2 : 4),
    backgroundColor:
        isError ? Colors.red : backgroundColor ?? const Color(0xFF424242),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    actionOverflowThreshold: overflowThreshold,
  );

  scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
}
