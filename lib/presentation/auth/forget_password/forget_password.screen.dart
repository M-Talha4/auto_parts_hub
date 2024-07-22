import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'controllers/forget_password.controller.dart';
import 'package:auto_parts_hub/domain/utils/validation.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/theme/text_size.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_button.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text_form_field.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: CustomText(
          text: LocaleKeys.auth_forget_password_text.tr,
        ),
        centerTitle: true,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                CustomText(
                  text: LocaleKeys.auth_write_email_to_get_reset_link_text.tr,
                  fontSize: AppTextSize.bodyLargeFont,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: height * 0.1,
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextFormField(
                          controller: controller.emailController,
                          hint: LocaleKeys.auth_enter_your_email_text.tr,
                          keyboardtype: TextInputType.emailAddress,
                          prefixIcon: const Icon(Icons.mail),
                          validation: (value) =>
                              Validation.emaiValidation(value),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Obx(() => LoadingButton(
                      isLoading: controller.isLoading.value,
                      onTap: () => controller.resetPassword(),
                      text: LocaleKeys.auth_reset_text.tr,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
