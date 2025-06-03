import '/domain/utils/context_extensions.dart';

import '/domain/const/assets_paths.dart';
import '/domain/const/static_data.dart';
import '/domain/utils/validation.dart';
import '/generated/locales.generated.dart';
import '/presentation/widgets/custom_button.dart';
import '/presentation/widgets/custom_text.dart';
import '/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'controllers/profile.controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
          title: CustomText(
            text: LocaleKeys.drawer_profile_text.tr,
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: 26,
              )),
          actions: [
            IconButton(
                onPressed: () =>
                    controller.isEnabled.value = !controller.isEnabled.value,
                icon: const Icon(
                  Icons.edit_outlined,
                  size: 26,
                )),
          ]),
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.all(width * 0.06),
          child: Form(
            key: controller.formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 65,
                          backgroundColor: context.colorScheme.outline,
                          child: Obx(
                            () => CircleAvatar(
                              radius: 60,
                              backgroundColor: context.colorScheme.secondary,
                              child: controller.imagePath.value == ''
                                  ? controller.isPicked.value ||
                                          controller.image != null
                                      ? ClipOval(
                                          child: Image.file(
                                            controller.image!.absolute,
                                            fit: BoxFit.cover,
                                            width: 120,
                                            height: 120,
                                          ),
                                        )
                                      : SvgPicture.asset(
                                          ImagePath.proileAvatarSvg,
                                          height: 80,
                                          colorFilter: ColorFilter.mode(
                                              context.colorScheme.onSecondary,
                                              BlendMode.srcIn),
                                        )
                                  : ClipOval(
                                      child: Image.network(
                                      controller.imagePath.value,
                                      fit: BoxFit.cover,
                                      width: 120,
                                      height: 120,
                                    )),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 8,
                          bottom: 8,
                          child: InkWell(
                              onTap: controller.pickFromGallery,
                              child: Icon(
                                Icons.camera_alt,
                                color: context.colorScheme.outlineVariant,
                                size: 26,
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: '${LocaleKeys.profile_user_id.tr} ',
                        fontSize: 18,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: CustomText(
                          text: StaticData.userId,
                          maxlines: 2,
                          fontSize: 18,
                          color: context.colorScheme.secondary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  CustomText(
                    text: LocaleKeys.profile_name.tr,
                    fontSize: 18,
                  ),
                  Obx(
                    () => CustomTextFormField(
                      controller: controller.nameController,
                      isEnabled: controller.isEnabled.value,
                      validator: (value) => Validation.fieldvalidation(
                          value, LocaleKeys.auth_enter_your_name_text.tr),
                    ),
                  ),
                  CustomText(
                    text: LocaleKeys.profile_phone_no.tr,
                    fontSize: 18,
                  ),
                  Obx(
                    () => CustomTextFormField(
                      controller: controller.phoneController,
                      isEnabled: controller.isEnabled.value,
                      validator: (value) =>
                          Validation.phoneNumberValidation(value),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(
                    () => controller.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomButton(
                            onPressed: controller.onSave,
                            text: LocaleKeys.button_save.tr,
                          ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
