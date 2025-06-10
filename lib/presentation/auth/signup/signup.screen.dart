import '../../../domain/const/const.dart';
import '/domain/utils/context_extensions.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'controllers/signup.controller.dart';
import '/domain/utils/validation.dart';
import '/generated/locales.generated.dart';
import '/infrastructure/theme/text_size.dart';
import '/presentation/widgets/custom_text.dart';
import '/presentation/widgets/custom_button.dart';
import '/presentation/widgets/custom_text_field.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          // title: CustomText(
          //   text: LocaleKeys.auth_sign_up_text.tr,
          // ),
          ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Column(
            spacing: 12,
            children: [
              const SizedBox(height: 80),

              //TODO Localization
              CustomText(
                text: 'Welcome to $APP_NAME',
                fontSize: AppTextSize.titleLargeFont,
              ),
              CustomText(
                text: 'Please provide details to create account and continue!',
                fontSize: AppTextSize.bodyMediumFont,
              ),
              const SizedBox(height: 12),

              CustomTextFormField(
                controller: controller.nameController,
                hint: LocaleKeys.auth_enter_your_name_text.tr,
                keyboardType: TextInputType.name,
                prefixIcon: const Icon(Icons.person),
                validator: (value) => Validation.fieldvalidation(
                    value, LocaleKeys.auth_enter_your_name_text.tr),
              ),

              CustomTextFormField(
                controller: controller.emailController,
                hint: LocaleKeys.auth_enter_your_email_text.tr,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.mail),
                validator: (value) => Validation.emaiValidation(value),
              ),

              CustomTextFormField(
                controller: controller.phoneNoController,
                hint: LocaleKeys.auth_number_example.tr,
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone),
                validator: (value) => Validation.phoneNumberValidation(value),
              ),

              Obx(
                () => CustomTextFormField(
                  controller: controller.passwordController,
                  hint: LocaleKeys.auth_enter_your_password_text.tr,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.hidePassword.value,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () => controller.showPassword(),
                      icon: controller.hidePassword.value
                          ? Icon(
                              Icons.visibility,
                              color: context.colorScheme.onPrimaryContainer,
                            )
                          : Icon(Icons.visibility_off,
                              color: context.colorScheme.onPrimaryContainer)),
                  validator: (value) => Validation.passwordValidation(value),
                ),
              ),

              Obx(
                () => CustomTextFormField(
                  controller: controller.confPasswordController,
                  hint: LocaleKeys.auth_retype_password_text.tr,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.hideConfirmPassword.value,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () => controller.showConfirmPassword(),
                      icon: controller.hideConfirmPassword.value
                          ? Icon(
                              Icons.visibility,
                              color: context.colorScheme.onPrimaryContainer,
                            )
                          : Icon(Icons.visibility_off,
                              color: context.colorScheme.onPrimaryContainer)),
                  validator: (value) => Validation.confirmPassword(
                      value, controller.passwordController.text),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 36),
                child: Obx(() => controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        onPressed: () => controller.signUp(),
                        text: LocaleKeys.auth_sign_up_text.tr,
                      )),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: LocaleKeys.auth_already_have_an_account_text.tr,
                  ),
                  TextButton(
                      onPressed: () => Get.back(),
                      child: CustomText(
                        text: LocaleKeys.auth_login_text.tr,
                        color: context.colorScheme.secondary,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
