import '/widgets/custom_button.dart';

import '../../../../../consts/app_color.dart';
import '/consts/const.dart';

import '/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../utils/style.dart';
import '../controllers/select_language_controller.dart';

class SelectLanguageView extends GetView<SelectLanguageController> {
  const SelectLanguageView({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.all(AppStyle.defaultPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              CustomText(
                text: selectLanguge,
                fontSize: AppStyle.headingsize(context),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Obx(() => Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(width * 0.02),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          onChanged: (value) => controller
                              .selectedLanguage.value = value.toString(),
                          value: controller.selectedLanguage.value,
                          isExpanded: true,
                          hint: const CustomText(text: selectALanguge),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: AppStyle.headingsize(context),
                          ),
                          items: controller.languages
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: CustomText(text: e),
                                ),
                              )
                              .toList()),
                    ),
                  )),
              const Expanded(child: SizedBox()),
              Obx(() => CustomButton(
                    onTap: () => controller.onContinue(),
                    text: continueText,
                    bgcolor: controller.selectedLanguage.value == selectALanguge
                        ? AppColor.lightGrey
                        : AppColor.primary,
                  )),
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
