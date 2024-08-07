import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/theme/text_size.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_button.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:auto_parts_hub/presentation/widgets/price_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/product_detail.controller.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  const ProductDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: AppTextSize.displayMediumFont,
                color: colorScheme(context).onPrimaryContainer,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: width * 0.85,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: colorScheme(context).secondary,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: NetworkImage(controller.product.productImage),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  height: height * 0.08,
                  alignment: Alignment.center,
                  child: CustomText(
                    text: controller.product.productName,
                    fontSize: AppTextSize.titleMediumFont,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: LocaleKeys.product_detail_product_brand.tr,
                            fontSize: AppTextSize.titleSmallFont,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            text: controller.product.productBrand,
                            fontSize: AppTextSize.titleSmallFont,
                            color: colorScheme(context).outline,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: LocaleKeys.product_detail_product_vehicle.tr,
                            fontSize: AppTextSize.titleSmallFont,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            text: controller.product.productVehicle,
                            fontSize: AppTextSize.titleSmallFont,
                            color: colorScheme(context).outline,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: LocaleKeys.product_detail_product_category.tr,
                            fontSize: AppTextSize.titleSmallFont,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            text: controller.product.productCategory,
                            fontSize: AppTextSize.titleSmallFont,
                            color: colorScheme(context).outline,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: LocaleKeys.product_detail_product_price.tr,
                            fontSize: AppTextSize.titleSmallFont,
                            fontWeight: FontWeight.w500,
                          ),
                          PriceText(
                              price: controller.product.productPrice,
                              currency: LocaleKeys.my_cart_pkr_text.tr),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomText(
                        text: LocaleKeys.product_detail_product_description.tr,
                        fontSize: AppTextSize.titleSmallFont,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomText(
                        text: controller.product.productDescription,
                        fontSize: AppTextSize.titleSmallFont,
                        color: colorScheme(context).outline,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => LoadingButton(
                      onTap: () {
                        if (!controller.isLoading.value) {
                          controller.addToCart();
                        }
                      },
                      isLoading: controller.isLoading.value,
                      text: LocaleKeys.product_detail_add_to_cart_text.tr),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }
}
