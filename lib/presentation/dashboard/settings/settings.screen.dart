import 'package:auto_parts_hub/domain/const/global_variable.dart';
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
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: AppTextSize.displayMediumFont,
              )),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => controller.selectLanguage(StaticData.language),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: LocaleKeys.settings_selected_language_text.tr,
                        fontSize: AppTextSize.titleMediumFont,
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
                CustomText(
                  text: '${LocaleKeys.settings_theme_mode_text.tr}:',
                  fontSize: AppTextSize.bodyLargeFont,
                  fontWeight: FontWeight.w500,
                ).paddingSymmetric(vertical: 4),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: colorScheme(context).outlineVariant,
                      borderRadius: BorderRadius.circular(4)),
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.themeModes.map((themeMode) {
                        return InkWell(
                          onTap: () => controller.selectTheme(themeMode),
                          child: Container(
                            width: 100,
                            height: controller.selectedLanguage.value ==
                                    LocaleKeys.select_language_russian_language
                                ? 60
                                : 32,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color:
                                    controller.selectedTheme.value == themeMode
                                        ? colorScheme(context).primary
                                        : colorScheme(context).surface,
                                borderRadius: BorderRadius.circular(8)),
                            child: CustomText(
                              text: themeMode.tr,
                              color: controller.selectedTheme.value == themeMode
                                  ? colorScheme(context).onPrimary
                                  : colorScheme(context).onSurface,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
