import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'controllers/forget_password.controller.dart';
import '/domain/utils/validation.dart';
import '/generated/locales.generated.dart';
import '/infrastructure/theme/text_size.dart';
import '/presentation/widgets/custom_text.dart';
import '/presentation/widgets/custom_button.dart';
import '/presentation/widgets/custom_text_field.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          //TODO Localization remove

          // title: CustomText(
          //   text: LocaleKeys.auth_forget_password_text.tr,
          // ),
          // leading: IconButton(
          //     onPressed: () => Get.back(),
          //     icon: const Icon(
          //       Icons.keyboard_arrow_left,
          //       size: 26,
          //     )),
          ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 12,
          children: [
            const SizedBox(height: 80),
            //TODO Localization
            CustomText(
              text: 'Don\'t remember your Password?',
              fontSize: AppTextSize.titleLargeFont,
            ),
            CustomText(
              text: 'Please enter your email to recieve a password reset link!',
              fontSize: AppTextSize.bodyMediumFont,
            ),
            //TODO Localization remove

            // CustomText(
            //   text: LocaleKeys.auth_write_email_to_get_reset_link_text.tr,
            //   fontSize: AppTextSize.bodyLargeFont,
            // ),

            const SizedBox(height: 12),
            Form(
              key: controller.formKey,
              child: CustomTextFormField(
                controller: controller.emailController,
                hint: LocaleKeys.auth_enter_your_email_text.tr,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.mail),
                validator: (value) => Validation.emaiValidation(value),
              ),
            ),
            SizedBox(height: 36),
            Obx(() => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomButton(
                    onPressed: () => controller.resetPassword(),
                    text: LocaleKeys.auth_reset_text.tr,
                  )),
          ],
        ),
      ),
    );
  }
}
