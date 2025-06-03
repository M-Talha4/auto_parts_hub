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
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: CustomText(
          text: LocaleKeys.auth_login_text.tr,
        ),
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
                  text: LocaleKeys.auth_login_text.tr,
                  fontSize: AppTextSize.titleLargeFont,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: height * 0.2,
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextFormField(
                          controller: controller.emailController,
                          hint: LocaleKeys.auth_enter_your_email_text.tr,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: const Icon(Icons.mail),
                          validator: (value) =>
                              Validation.emaiValidation(value),
                        ),
                        const SizedBox(
                          height: 10,
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
                                        color: context
                                            .colorScheme.onPrimaryContainer,
                                      )
                                    : Icon(Icons.visibility_off,
                                        color: context
                                            .colorScheme.onPrimaryContainer)),
                            validator: (value) =>
                                Validation.passwordValidation(value),
                          ),
                        ),
                      ],
                    ),
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
                SizedBox(
                  height: height * 0.04,
                ),
                Obx(() => controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        onPressed: () => controller.login(),
                        text: LocaleKeys.auth_login_text.tr,
                      )),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: LocaleKeys.auth_dont_have_an_account_text.tr,
                    ),
                    TextButton(
                        onPressed: () => Get.offNamed(Routes.SIGNUP),
                        child: CustomText(
                          text: LocaleKeys.auth_sign_up_text.tr,
                          color: context.colorScheme.secondary,
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
