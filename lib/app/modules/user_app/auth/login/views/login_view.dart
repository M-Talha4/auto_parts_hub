import '/app/routes/app_pages.dart';
import '/widgets/custom_button.dart';

import '../../../../../../utils/validation.dart';
import '/consts/app_color.dart';
import '/consts/const.dart';
import '/widgets/custom_text.dart';
import '/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../../utils/style.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(loginText),
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
              SizedBox(
                height: height * 0.1,
              ),
              CustomText(
                text: loginText,
                fontSize: AppStyle.headingsize(context),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              SizedBox(
                height: height * 0.2,
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RectangularTextFormField(
                        controller: controller.emailController,
                        hint: enterYourEmailText,
                        prefixIcon: Icon(Icons.mail),
                        validation: (value) => Validation.emaiValidation(value),
                      ),
                      Obx(
                        () => RectangularTextFormField(
                          controller: controller.passwordController,
                          hint: enterYourEmailText,
                          obscureText: controller.hidePassword.value,
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () => controller.showPassword(),
                              icon: controller.hidePassword.value
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off)),
                          validation: (value) =>
                              Validation.passworddValidation(value),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    child: CustomText(
                      text: forgotPasswordText,
                      color: AppColor.primaryLight,
                    )),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Obx(() => LoadingButton(
                    isLoading: controller.isLoading.value,
                    onTap: () => controller.login(),
                    text: loginText,
                  )),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: dontHaveAnAccountText,
                  ),
                  TextButton(
                      onPressed: () => Get.offNamed(Routes.SIGNUP),
                      child: CustomText(
                        text: signUpText,
                        color: AppColor.primaryLight,
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
