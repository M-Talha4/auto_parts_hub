import '/domain/utils/context_extensions.dart';

import '/generated/locales.generated.dart';
import '/infrastructure/navigation/routes.dart';
import '/infrastructure/theme/text_size.dart';
import '/presentation/widgets/custom_text.dart';
import '/presentation/widgets/price_rich_text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'controllers/manage_products.controller.dart';

class ManageProductsScreen extends GetView<ManageProductsController> {
  const ManageProductsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: LocaleKeys.admin_panel_manage_products_text.tr,
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: AppTextSize.displayMediumFont,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Obx(
            () => ListView.builder(
                itemCount: controller.productsList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        title: CustomText(
                            text: controller.productsList[index].productName),
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: context.colorScheme.onSurface,
                                    borderRadius: BorderRadius.circular(6),
                                    image: DecorationImage(
                                      image: NetworkImage(controller
                                          .productsList[index].productImage),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              text: LocaleKeys
                                                  .product_detail_product_brand
                                                  .tr,
                                              fontSize:
                                                  AppTextSize.titleSmallFont,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            CustomText(
                                              text: controller
                                                  .productsList[index]
                                                  .productBrand,
                                              fontSize:
                                                  AppTextSize.titleSmallFont,
                                              color:
                                                  context.colorScheme.outline,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              text: LocaleKeys
                                                  .product_detail_product_vehicle
                                                  .tr,
                                              fontSize:
                                                  AppTextSize.titleSmallFont,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            CustomText(
                                              text: controller
                                                  .productsList[index]
                                                  .productVehicle,
                                              fontSize:
                                                  AppTextSize.titleSmallFont,
                                              color:
                                                  context.colorScheme.outline,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              text: LocaleKeys
                                                  .product_detail_product_category
                                                  .tr,
                                              fontSize:
                                                  AppTextSize.titleSmallFont,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            CustomText(
                                              text: controller
                                                  .productsList[index]
                                                  .productCategory,
                                              fontSize:
                                                  AppTextSize.titleSmallFont,
                                              color:
                                                  context.colorScheme.outline,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              text: LocaleKeys
                                                  .product_detail_product_price
                                                  .tr,
                                              fontSize:
                                                  AppTextSize.titleSmallFont,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            PriceText(
                                                price: controller
                                                    .productsList[index]
                                                    .productPrice,
                                                currency: LocaleKeys
                                                    .my_cart_pkr_text.tr),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        CustomText(
                                          text: LocaleKeys
                                              .product_detail_product_description
                                              .tr,
                                          fontSize: AppTextSize.titleSmallFont,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        CustomText(
                                          text: controller.productsList[index]
                                              .productDescription,
                                          fontSize: AppTextSize.titleSmallFont,
                                          color: context.colorScheme.outline,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ).paddingAll(8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () => controller.confirmDeletion(
                                      context,
                                      controller.productsList[index].productId),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          context.colorScheme.error),
                                  child: CustomText(
                                      text: LocaleKeys.button_delete.tr)),
                              ElevatedButton(
                                  onPressed: () => Get.offNamed(
                                      Routes.ADD_PRODUCTS,
                                      arguments:
                                          controller.productsList[index]),
                                  child: CustomText(
                                      text: LocaleKeys.button_edit.tr))
                            ],
                          ).paddingOnly(bottom: 8, left: 4, right: 4)
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ));
  }
}
