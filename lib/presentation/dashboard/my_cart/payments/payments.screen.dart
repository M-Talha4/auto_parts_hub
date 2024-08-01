import 'package:auto_parts_hub/domain/const/assets_paths.dart';
import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/navigation/routes.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_button.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:auto_parts_hub/presentation/widgets/price_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/payments.controller.dart';

class PaymentsScreen extends GetView<PaymentsController> {
  const PaymentsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
          title: CustomText(
            text: LocaleKeys.payment_payment_text.tr,
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: 26,
              )),
          actions: [
            IconButton(
                onPressed: () =>
                    controller.showCVV.value = !controller.showCVV.value,
                icon: Obx(
                  () => Icon(
                    controller.showCVV.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    size: 26,
                  ),
                )),
          ]),
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => controller.cardList.isEmpty
                    ? Center(
                        child: CustomText(
                        text: LocaleKeys.payment_no_card_found_text.tr,
                        fontSize: 20,
                      ))
                    : ListView.builder(
                        itemCount: controller.cardList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Obx(
                            () => Card(
                              color: controller.selectedIndex.value == index
                                  ? colorScheme(context).secondary
                                  : Colors.white,
                              child: ListTile(
                                  onTap: () =>
                                      controller.selectedIndex.value = index,
                                  minLeadingWidth: 5,
                                  leading: const SizedBox(),
                                  title: Text(
                                    controller.cardList[index].name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  subtitle: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            controller.cardList[index]
                                                        .cardType ==
                                                    LocaleKeys.payment_visa_text
                                                ? ImagePath.visaLogoImage
                                                : ImagePath.masterCardLogoImage,
                                            width: 50,
                                          )
                                        ],
                                      ),
                                      Text(
                                        controller.cardList[index].cardNo,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${LocaleKeys.payment_exp_date_text.tr} ',
                                          ),
                                          Text(
                                            controller.showCVV.value
                                                ? controller
                                                    .cardList[index].expDate
                                                : '****',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${LocaleKeys.payment_cvv_code_text.tr} ',
                                          ),
                                          Text(controller.showCVV.value
                                              ? controller
                                                  .cardList[index].cvvCode
                                              : '***'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: InkWell(
                                      onTap: () => controller.confirmDeletion(
                                          context,
                                          controller.cardList[index].id,
                                          index),
                                      child: Icon(
                                        Icons.delete,
                                        color: controller.selectedIndex.value ==
                                                index
                                            ? colorScheme(context).onSurface
                                            : colorScheme(context).error,
                                      ))),
                            ),
                          );
                        }),
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
                  ),
                  PriceText(
                      price: controller.amount,
                      currency: LocaleKeys.my_cart_pkr_text.tr),
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
                  ),
                  Obx(
                    () => PriceText(
                        price: controller.totalAmount.value,
                        currency: LocaleKeys.my_cart_pkr_text.tr),
                  ),
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
              Obx(
                () => LoadingButton(
                    onTap: () => controller.onTapContinue(),
                    isLoading: controller.isLoading.value,
                    text: LocaleKeys.button_continue.tr),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.ADD_CARD),
          backgroundColor: colorScheme(context).primary,
          child: Icon(
            Icons.add_card,
            color: colorScheme(context).onPrimary,
            size: 26,
          ),
        ),
      ),
    );
  }
}
