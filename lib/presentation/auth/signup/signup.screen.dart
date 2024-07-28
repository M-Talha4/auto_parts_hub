import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'controllers/signup.controller.dart';
import 'package:auto_parts_hub/domain/utils/validation.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/theme/text_size.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:auto_parts_hub/infrastructure/navigation/routes.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_button.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text_form_field.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: CustomText(
          text: LocaleKeys.auth_sign_up_text.tr,
        ),
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
                CustomText(
                  text: LocaleKeys.auth_sign_up_text.tr,
                  fontSize: AppTextSize.bodyLargeFont,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: height * 0.4,
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomTextFormField(
                          controller: controller.nameController,
                          hint: LocaleKeys.auth_enter_your_name_text.tr,
                          keyboardtype: TextInputType.name,
                          prefixIcon: const Icon(Icons.person),
                          validation: (value) => Validation.fieldvalidation(
                              value, LocaleKeys.auth_enter_your_name_text.tr),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: controller.emailController,
                          hint: LocaleKeys.auth_enter_your_email_text.tr,
                          keyboardtype: TextInputType.emailAddress,
                          prefixIcon: const Icon(Icons.mail),
                          validation: (value) =>
                              Validation.emaiValidation(value),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: controller.phoneNoController,
                          hint: LocaleKeys.auth_number_example.tr,
                          keyboardtype: TextInputType.phone,
                          prefixIcon: const Icon(Icons.phone),
                          validation: (value) =>
                              Validation.phoneNumberValidation(value),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => CustomTextFormField(
                            controller: controller.passwordController,
                            hint: LocaleKeys.auth_enter_your_password_text.tr,
                            keyboardtype: TextInputType.visiblePassword,
                            obscureText: controller.hidePassword.value,
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () => controller.showPassword(),
                                icon: controller.hidePassword.value
                                    ? Icon(
                                        Icons.visibility,
                                        color: colorScheme(context)
                                            .onPrimaryContainer,
                                      )
                                    : Icon(Icons.visibility_off,
                                        color: colorScheme(context)
                                            .onPrimaryContainer)),
                            validation: (value) =>
                                Validation.passwordValidation(value),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => CustomTextFormField(
                            controller: controller.confPasswordController,
                            hint: LocaleKeys.auth_retype_password_text.tr,
                            keyboardtype: TextInputType.visiblePassword,
                            obscureText: controller.hideConfirmPassword.value,
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () =>
                                    controller.showConfirmPassword(),
                                icon: controller.hideConfirmPassword.value
                                    ? Icon(
                                        Icons.visibility,
                                        color: colorScheme(context)
                                            .onPrimaryContainer,
                                      )
                                    : Icon(Icons.visibility_off,
                                        color: colorScheme(context)
                                            .onPrimaryContainer)),
                            validation: (value) => Validation.confirmPassword(
                                value, controller.passwordController.text),
                          ),
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
                      onTap: () => controller.signUp(),
                      text: LocaleKeys.auth_sign_up_text.tr,
                    )),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: LocaleKeys.auth_already_have_an_account_text.tr,
                    ),
                    TextButton(
                        onPressed: () => Get.offNamed(Routes.LOGIN),
                        child: CustomText(
                          text: LocaleKeys.auth_login_text.tr,
                          color: colorScheme(context).secondary,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
