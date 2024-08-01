import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/theme/text_size.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_button.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:auto_parts_hub/presentation/widgets/price_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/my_cart.controller.dart';

class MyCartScreen extends GetView<MyCartController> {
  const MyCartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: LocaleKeys.drawer_my_cart_text.tr,
        ),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.keyboard_arrow_left,
              size: AppTextSize.displayMediumFont,
            )),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.all(width * 0.06),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: height * 0.07,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        width: 1, color: colorScheme(context).primary)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: LocaleKeys.my_cart_products_text.tr,
                      fontSize: height * 0.035,
                      fontWeight: FontWeight.w400,
                    ),
                    const VerticalDivider(
                      width: 1,
                    ),
                    Obx(
                      () => CustomText(
                        text:
                            '${controller.cartItems.length} ${LocaleKeys.my_cart_items_text.tr}',
                        fontSize: height * 0.035,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Obx(
                () => ListView.separated(
                    itemCount: controller.cartItems.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => Divider(
                          height: height * 0.03,
                          thickness: 1,
                          color: colorScheme(context).secondary,
                        ),
                    itemBuilder: (context, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: width * 0.3,
                              width: width * 0.3,
                              decoration: BoxDecoration(
                                  color: colorScheme(context).secondary,
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        controller.cartItems[index].itemImage),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            SizedBox(
                              width: width * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: controller.cartItems[index].itemName,
                                    fontSize: 16,
                                    maxlines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  PriceText(
                                      price:
                                          controller.cartItems[index].itemPrice,
                                      currency: LocaleKeys.my_cart_pkr_text.tr),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                InkWell(
                                    onTap: () =>
                                        controller.increaseItemsCount(index),
                                    child: const Icon(Icons.add)),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: colorScheme(context).primary)),
                                  child: Obx(
                                    () => CustomText(
                                      text: controller.count[index].toString(),
                                    ),
                                  ),
                                ),
                                InkWell(
                                    onTap: () =>
                                        controller.decreaseItemsCount(index),
                                    child: const Icon(Icons.remove)),
                              ],
                            )
                          ],
                        )),
              ),
              Divider(
                height: height * 0.05,
                thickness: 1,
                color: colorScheme(context).secondary,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: LocaleKeys.my_cart_amount_text.tr,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  Obx(() => PriceText(
                      price: controller.amount.value,
                      currency: LocaleKeys.my_cart_pkr_text.tr)),
                ],
              ),
              Divider(
                height: height * 0.05,
                thickness: 1,
                color: colorScheme(context).secondary,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: LocaleKeys.my_cart_discount_text.tr,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  Obx(
                    () => PriceText(
                        price: controller.discount.value,
                        currency: LocaleKeys.my_cart_pkr_text.tr),
                  ),
                ],
              ),
              Divider(
                height: height * 0.05,
                thickness: 1,
                color: colorScheme(context).secondary,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: LocaleKeys.my_cart_total_amount_text.tr,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  Obx(
                    () => PriceText(
                        price: controller.totalAmount.value,
                        currency: LocaleKeys.my_cart_pkr_text.tr),
                  )
                ],
              ),
              Divider(
                height: height * 0.05,
                thickness: 1,
                color: colorScheme(context).secondary,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              CustomButton(
                  onTap: () => controller.onTapContinue(),
                  text: LocaleKeys.button_continue.tr)
            ]),
          ),
        ),
      ),
    );
  }
}
