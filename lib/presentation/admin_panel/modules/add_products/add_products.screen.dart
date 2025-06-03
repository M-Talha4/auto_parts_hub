import '/domain/utils/context_extensions.dart';

import '/domain/utils/validation.dart';
import '/generated/locales.generated.dart';
import '/infrastructure/theme/text_size.dart';
import '/presentation/widgets/custom_button.dart';
import '/presentation/widgets/custom_text.dart';
import '/presentation/widgets/custom_text_field.dart';
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
                        color: context.colorScheme.outline),
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
                                      color: context.colorScheme.onPrimary,
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
                      validator: (value) => Validation.fieldvalidation(value,
                          LocaleKeys.admin_panel_enter_product_name_text.tr),
                    ).paddingOnly(bottom: 12),
                    CustomText(
                        text:
                            '${LocaleKeys.admin_panel_product_brand_text.tr}:'),
                    CustomTextFormField(
                      controller: controller.brandController,
                      hint: LocaleKeys.admin_panel_enter_product_brand_text.tr,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => Validation.fieldvalidation(value,
                          LocaleKeys.admin_panel_enter_product_brand_text.tr),
                    ).paddingOnly(bottom: 12),
                    CustomText(
                        text:
                            '${LocaleKeys.admin_panel_product_vehicle_text.tr}:'),
                    CustomTextFormField(
                      controller: controller.vehicleController,
                      hint:
                          LocaleKeys.admin_panel_enter_product_vehicle_text.tr,
                      labelText:
                          LocaleKeys.admin_panel_enter_product_vehicle_text.tr,
                      keyboardType: TextInputType.phone,
                      validator: (value) => Validation.fieldvalidation(value,
                          LocaleKeys.admin_panel_enter_product_vehicle_text.tr),
                    ).paddingOnly(bottom: 12),
                    CustomText(
                        text: '${LocaleKeys.admin_panel_category_text.tr}:'),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                          color: context.colorScheme.surface,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 1,
                              color: context.colorScheme.outlineVariant),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3,
                                color:
                                    context.colorScheme.outline.withAlpha(75),
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
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
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
                      keyboardType: TextInputType.visiblePassword,
                      maxline: 5,
                      validator: (value) => Validation.fieldvalidation(value,
                          LocaleKeys.admin_panel_enter_product_desc_text.tr),
                    ).paddingOnly(bottom: 12),
                  ],
                ),
              ),
              Obx(() => controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomButton(
                      onPressed: () => controller.addOrEdit(),
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
