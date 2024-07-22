import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/theme/text_size.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/settings.controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: LocaleKeys.drawer_settings_text.tr,
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: AppTextSize.displayMediumFont,
              )),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () => controller.selectLanguage(StaticData.language),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        // text: LocaleKeys.select_language_select_language.tr,
                        text: 'Selected Language',
                        fontSize: AppTextSize.titleSmallFont,
                        fontWeight: FontWeight.w500,
                      ),
                      Obx(
                        () => CustomText(
                          text: controller.selectedLanguage.value.tr,
                          fontSize: AppTextSize.titleSmallFont,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      // text: LocaleKeys.select_language_select_language.tr,
                      text: 'DarkMode',
                      fontSize: AppTextSize.titleSmallFont,
                      fontWeight: FontWeight.w500,
                    ),
                    Obx(
                      () => Switch.adaptive(
                        value: controller.isDarkMode.value,
                        onChanged: (bool value) => controller.darkMode(value),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
