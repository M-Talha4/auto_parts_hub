import '/domain/utils/context_extensions.dart';

import '/generated/locales.generated.dart';
import '/infrastructure/navigation/routes.dart';
import '/presentation/widgets/custom_button.dart';
import '/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/order_placed.controller.dart';

class OrderPlacedScreen extends GetView<OrderPlacedController> {
  const OrderPlacedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.all(width * 0.06),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 4, color: context.colorScheme.secondary)),
                  child: Icon(
                    Icons.done_all_rounded,
                    size: width * 0.4,
                    color: context.colorScheme.secondary,
                  ),
                ),
                CustomText(
                  text: LocaleKeys.my_cart_order_placed_text.tr,
                  fontSize: height * 0.055,
                  color: context.colorScheme.secondary,
                  fontstyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                ),
                SizedBox(
                  width: width * 0.5,
                  child: CustomText(
                    text: LocaleKeys.my_cart_thank_you_for_your_order_text.tr,
                    fontSize: height * 0.04,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
                CustomButton(
                    onPressed: () => Get.offAllNamed(Routes.HOME),
                    text: LocaleKeys.button_back_to_home.tr)
              ]),
        ),
      ),
    );
  }
}
