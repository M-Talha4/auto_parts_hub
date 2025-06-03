import '/domain/utils/context_extensions.dart';

import '/infrastructure/theme/text_size.dart';
import '../../generated/locales.generated.dart';
import 'controllers/language.controller.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import 'package:get/get.dart';

class LanguageScreen extends GetView<LanguageController> {
  const LanguageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: LocaleKeys.select_language_select_language.tr,
        ),
      ),
      body: GetBuilder(
          init: LanguageController(),
          builder: (_) {
            return SizedBox(
              width: width,
              height: height,
              child: Padding(
                padding: EdgeInsets.all(width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: controller.languages.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () => controller.onLanguageSelected(index),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                                color: index == controller.selectedIndex
                                    ? context.colorScheme.primary
                                    : null,
                                borderRadius: BorderRadius.circular(5)),
                            child: CustomText(
                              text: controller.languages[index].tr,
                              fontSize: AppTextSize.titleSmallFont,
                              color: index == controller.selectedIndex
                                  ? context.colorScheme.onPrimary
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                    CustomButton(
                      onPressed: () => controller.onContinue(),
                      text: LocaleKeys.button_continue.tr,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
