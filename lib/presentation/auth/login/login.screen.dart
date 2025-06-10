import '/domain/utils/context_extensions.dart';

import '/domain/utils/validation.dart';
import '/generated/locales.generated.dart';
import '/infrastructure/navigation/routes.dart';
import '/infrastructure/theme/text_size.dart';
import '/presentation/widgets/custom_button.dart';
import '/presentation/widgets/custom_text.dart';
import '/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          // title: CustomText(
          //   text: LocaleKeys.auth_login_text.tr,
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
                text: 'Welcome Back',
                fontSize: AppTextSize.titleLargeFont,
              ),
              CustomText(
                text: 'Please enter your email and password to continue!',
                fontSize: AppTextSize.bodyMediumFont,
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                controller: controller.emailController,
                hint: LocaleKeys.auth_enter_your_email_text.tr,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.mail),
                validator: (value) => Validation.emaiValidation(value),
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () => Get.toNamed(Routes.FORGET_PASSWORD),
                    child: CustomText(
                      text: LocaleKeys.auth_forgot_password_text.tr,
                      color: context.colorScheme.secondary,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 36),
                child: Obx(() => controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        onPressed: () => controller.login(),
                        text: LocaleKeys.auth_login_text.tr,
                      )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: LocaleKeys.auth_dont_have_an_account_text.tr,
                  ),
                  InkWell(
                      onTap: () => Get.toNamed(Routes.SIGNUP),
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 4),
                        child: CustomText(
                          text: LocaleKeys.auth_sign_up_text.tr,
                          color: context.colorScheme.secondary,
                        ),
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
