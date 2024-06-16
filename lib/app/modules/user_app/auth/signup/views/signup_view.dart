import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../../consts/app_color.dart';
import '../../../../../../consts/const.dart';
import '../../../../../../utils/style.dart';
import '../../../../../../utils/validation.dart';
import '../../../../../../widgets/custom_button.dart';
import '../../../../../../widgets/custom_text.dart';
import '../../../../../../widgets/custom_text_form_field.dart';
import '../../../../../routes/app_pages.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(signUpText),
        centerTitle: true,
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.all(AppStyle.defaultPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              CustomText(
                text: signUpText,
                fontSize: AppStyle.headingsize(context),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              SizedBox(
                height: height * 0.4,
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RectangularTextFormField(
                        controller: controller.nameController,
                        hint: enterYourNameText,
                        prefixIcon: const Icon(Icons.person),
                        validation: (value) => Validation.fieldvalidation(
                            value, enterYourNameText),
                      ),
                      RectangularTextFormField(
                        controller: controller.emailController,
                        hint: enterYourEmailText,
                        prefixIcon: const Icon(Icons.mail),
                        validation: (value) => Validation.emaiValidation(value),
                      ),
                      Obx(
                        () => RectangularTextFormField(
                          controller: controller.passwordController,
                          hint: enterYourEmailText,
                          obscureText: controller.hidePassword.value,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () => controller.showPassword(),
                              icon: controller.hidePassword.value
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          validation: (value) =>
                              Validation.passworddValidation(value),
                        ),
                      ),
                      Obx(
                        () => RectangularTextFormField(
                          controller: controller.confPasswordController,
                          hint: retypePasswordText,
                          obscureText: controller.hideConfirmPassword.value,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () => controller.showConfirmPassword(),
                              icon: controller.hideConfirmPassword.value
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
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
                    text: signUpText,
                  )),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: alreadyHaveAnAccountText,
                  ),
                  TextButton(
                      onPressed: () => Get.offNamed(Routes.LOGIN),
                      child: CustomText(
                        text: loginText,
                        color: AppColor.primaryLight,
                      )),
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
