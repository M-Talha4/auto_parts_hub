import '/domain/utils/context_extensions.dart';

import '/domain/const/assets_paths.dart';
import '/domain/utils/validation.dart';
import '/generated/locales.generated.dart';
import '/presentation/widgets/custom_button.dart';
import '/presentation/widgets/custom_text.dart';
import '/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/add_card.controller.dart';

class AddCardScreen extends GetView<AddCardController> {
  const AddCardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: CustomText(
          text: LocaleKeys.payment_add_credit_card_text.tr,
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
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color: context.colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3,
                                    color: context.colorScheme.outline
                                        .withAlpha(75),
                                    offset: const Offset(2, 4))
                              ]),
                          child: Row(
                            children: [
                              Obx(
                                () => controller.selectedCardType.value ==
                                        LocaleKeys.payment_select_card_type_text
                                    ? const Expanded(
                                        child:
                                            Icon(Icons.card_membership_rounded))
                                    : controller.selectedCardType.value ==
                                            LocaleKeys.payment_visa_text
                                        ? Expanded(
                                            child: Image.asset(
                                                ImagePath.visaLogoImage))
                                        : Expanded(
                                            child: Image.asset(
                                                ImagePath.masterCardLogoImage)),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: width * 0.67,
                                child: DropdownButtonHideUnderline(
                                    child: Obx(
                                  () => DropdownButton(
                                    onChanged: (value) => controller
                                        .selectedCardType.value = value!,
                                    value: controller.selectedCardType.value,
                                    isExpanded: true,
                                    items: controller.dropdownMenuItems
                                        .map((element) => DropdownMenuItem(
                                            value: element,
                                            child: CustomText(
                                              text: element.tr,
                                            )))
                                        .toList(),
                                  ),
                                )),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: controller.nameController,
                          hint: LocaleKeys.payment_enter_name_on_card_text.tr,
                          keyboardType: TextInputType.name,
                          prefixIcon: const Icon(Icons.label),
                          validator: (value) => Validation.fieldvalidation(
                              value,
                              LocaleKeys.payment_enter_name_on_card_text.tr),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: controller.cardNoController,
                          hint: LocaleKeys.payment_card_no_example_text.tr,
                          keyboardType: TextInputType.text,
                          prefixIcon: const Icon(Icons.numbers),
                          validator: (value) =>
                              Validation.cardNumberValidation(value),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: CustomTextFormField(
                                controller: controller.expDateController,
                                hint:
                                    LocaleKeys.payment_exp_date_example_text.tr,
                                maxLength: 5,
                                keyboardType: TextInputType.datetime,
                                prefixIcon:
                                    const Icon(Icons.date_range_outlined),
                                validator: (value) =>
                                    Validation.expiryDateValidation(
                                  value,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: CustomTextFormField(
                                controller: controller.cvvCodeController,
                                hint:
                                    LocaleKeys.payment_cvv_code_example_text.tr,
                                maxLength: 3,
                                keyboardType: TextInputType.number,
                                prefixIcon: const Icon(Icons.numbers),
                                validator: (value) => Validation.cvvValidation(
                                  value,
                                ),
                              ),
                            ),
                          ],
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
                        onPressed: () => controller.addCard(),
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
