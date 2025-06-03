import '/domain/utils/validation.dart';
import '/generated/locales.generated.dart';
import '/presentation/widgets/custom_button.dart';
import '/presentation/widgets/custom_text.dart';
import '/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/add_address.controller.dart';

class AddAddressScreen extends GetView<AddAddressController> {
  const AddAddressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: CustomText(
          text: LocaleKeys.address_add_address_text.tr,
        ),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.keyboard_arrow_left,
              size: 26,
            )),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.all(width * 0.06),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: height * 0.4,
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomTextFormField(
                          controller: controller.nameController,
                          hint: LocaleKeys.address_enter_address_name_text.tr,
                          keyboardType: TextInputType.name,
                          prefixIcon: const Icon(Icons.label),
                          validator: (value) => Validation.fieldvalidation(
                              value,
                              LocaleKeys.address_enter_address_name_text.tr),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: controller.addressController,
                          hint: LocaleKeys.address_enter_address_text.tr,
                          keyboardType: TextInputType.streetAddress,
                          prefixIcon: const Icon(Icons.location_on),
                          validator: (value) => Validation.fieldvalidation(
                              value, LocaleKeys.address_enter_address_text.tr),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: controller.cityController,
                          hint: LocaleKeys.address_enter_city_text.tr,
                          keyboardType: TextInputType.streetAddress,
                          prefixIcon: const Icon(Icons.location_city),
                          validator: (value) => Validation.fieldvalidation(
                              value, LocaleKeys.address_enter_city_text.tr),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: controller.postalCodeController,
                          hint: LocaleKeys.address_enter_postal_code_text.tr,
                          keyboardType: const TextInputType.numberWithOptions(),
                          prefixIcon:
                              const Icon(Icons.qr_code_scanner_outlined),
                          validator: (value) => Validation.fieldvalidation(
                              value,
                              LocaleKeys.address_enter_postal_code_text.tr),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Obx(() => controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        onPressed: () => controller.addAddress(),
                        text: LocaleKeys.button_add.tr,
                      )),
                SizedBox(
                  height: height * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
