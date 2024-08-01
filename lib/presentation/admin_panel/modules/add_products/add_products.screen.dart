import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/domain/utils/validation.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/theme/imports.dart';
import 'package:auto_parts_hub/infrastructure/theme/text_size.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_button.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/add_products.controller.dart';

class AddProductsScreen extends GetView<AddProductsController> {
  const AddProductsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: controller.isEditing
              ? LocaleKeys.admin_panel_edit_product_text.tr
              : LocaleKeys.admin_panel_add_products_text.tr,
        ),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.keyboard_arrow_left,
              size: AppTextSize.displayMediumFont,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: InkWell(
                  onTap: () => controller.pickFromGallery(),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: colorScheme(context).outline),
                    child: Obx(
                      () => controller.imagePath.value == ''
                          ? controller.isPicked.value ||
                                  controller.image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    controller.image!.absolute,
                                    fit: BoxFit.cover,
                                    width: 150,
                                    height: 150,
                                  ),
                                )
                              : controller.isEditing
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.network(
                                        controller.product!.productImage,
                                        fit: BoxFit.cover,
                                        width: 150,
                                        height: 150,
                                      ),
                                    )
                                  : Icon(
                                      Icons.image_outlined,
                                      color: colorScheme(context).onPrimary,
                                      size: 150,
                                    )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                controller.imagePath.value,
                                fit: BoxFit.cover,
                                width: 100,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text:
                            '${LocaleKeys.admin_panel_product_name_text.tr}:'),
                    CustomTextFormField(
                      controller: controller.nameController,
                      hint: LocaleKeys.admin_panel_enter_product_name_text.tr,
                      validation: (value) => Validation.fieldvalidation(value,
                          LocaleKeys.admin_panel_enter_product_name_text.tr),
                    ).paddingOnly(bottom: 12),
                    CustomText(
                        text:
                            '${LocaleKeys.admin_panel_product_brand_text.tr}:'),
                    CustomTextFormField(
                      controller: controller.brandController,
                      hint: LocaleKeys.admin_panel_enter_product_brand_text.tr,
                      keyboardtype: TextInputType.emailAddress,
                      validation: (value) => Validation.fieldvalidation(value,
                          LocaleKeys.admin_panel_enter_product_brand_text.tr),
                    ).paddingOnly(bottom: 12),
                    CustomText(
                        text:
                            '${LocaleKeys.admin_panel_product_vehicle_text.tr}:'),
                    CustomTextFormField(
                      controller: controller.vehicleController,
                      hint:
                          LocaleKeys.admin_panel_enter_product_vehicle_text.tr,
                      label:
                          LocaleKeys.admin_panel_enter_product_vehicle_text.tr,
                      keyboardtype: TextInputType.phone,
                      validation: (value) => Validation.fieldvalidation(value,
                          LocaleKeys.admin_panel_enter_product_vehicle_text.tr),
                    ).paddingOnly(bottom: 12),
                    CustomText(
                        text: '${LocaleKeys.admin_panel_category_text.tr}:'),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                          color: colorScheme(context).surface,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 1,
                              color: colorScheme(context).outlineVariant),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3,
                                color: colorScheme(context)
                                    .outline
                                    .withOpacity(0.3),
                                offset: const Offset(2, 4))
                          ]),
                      child: Obx(
                        () => DropdownButtonHideUnderline(
                            child: DropdownButton(
                                onChanged: (value) =>
                                    controller.selectedCategory.value = value!,
                                value: controller.selectedCategory.value,
                                isDense: true,
                                isExpanded: true,
                                items: controller.categoryList
                                    .map((category) => DropdownMenuItem(
                                        value: category,
                                        child: CustomText(text: category.tr)))
                                    .toList())),
                      ),
                    ).paddingOnly(bottom: 12),
                    CustomText(
                        text:
                            '${LocaleKeys.admin_panel_product_price_text.tr}:'),
                    CustomTextFormField(
                      controller: controller.priceController,
                      hint: LocaleKeys.admin_panel_enter_product_price_text.tr,
                      keyboardtype: TextInputType.visiblePassword,
                      validation: (value) {
                        RegExp regex = RegExp(r'^\d+$');
                        if (value == null ||
                            !regex.hasMatch(value.toString())) {
                          return '${LocaleKeys.validation_please.tr} ${LocaleKeys.admin_panel_enter_product_price_text.tr}';
                        }
                        return null;
                      },
                    ).paddingOnly(bottom: 12),
                    CustomText(
                        text:
                            '${LocaleKeys.admin_panel_product_desc_text.tr}:'),
                    CustomTextFormField(
                      controller: controller.descController,
                      hint: LocaleKeys.admin_panel_enter_product_desc_text.tr,
                      keyboardtype: TextInputType.visiblePassword,
                      maxline: 5,
                      validation: (value) => Validation.fieldvalidation(value,
                          LocaleKeys.admin_panel_enter_product_desc_text.tr),
                    ).paddingOnly(bottom: 12),
                  ],
                ),
              ),
              Obx(() => LoadingButton(
                    isLoading: controller.isLoading.value,
                    onTap: () => controller.addOrEdit(),
                    text: controller.isEditing
                        ? LocaleKeys.button_edit.tr
                        : LocaleKeys.button_add.tr,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
