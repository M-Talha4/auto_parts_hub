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
              CustomText(
                text: selectLanguge,
                fontSize: AppStyle.headingsize(context),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: controller.languages.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => controller.onLanguageSelected(index),
                    child: Obx(
                      () => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                            color: index == controller.selectedIndex.value
                                ? AppColor.primary
                                : null,
                            borderRadius: BorderRadius.circular(5)),
                        child: CustomText(
                          text: controller.languages[index],
                          fontSize: width * 0.05,
                          color: index == controller.selectedIndex.value
                              ? AppColor.white
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              CustomButton(
                onTap: () => controller.onContinue(),
                text: continueText,
                // bgcolor: controller.selectedIndex.value == null
                //     ? AppColor.lightGrey
                //     : AppColor.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
