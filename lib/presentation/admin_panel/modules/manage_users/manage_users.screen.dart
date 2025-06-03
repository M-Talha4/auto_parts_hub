import '/domain/utils/context_extensions.dart';

import '/domain/const/assets_paths.dart';
import '/generated/locales.generated.dart';
import '/infrastructure/theme/text_size.dart';
import '/presentation/widgets/custom_text.dart';
import 'package:flutter_svg/svg.dart';
import 'controllers/manage_users.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageUsersScreen extends GetView<ManageUsersController> {
  const ManageUsersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: LocaleKeys.admin_panel_manage_users_text.tr,
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: AppTextSize.displayMediumFont,
              )),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => ListView.builder(
                  itemCount: controller.usersList.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => controller.confirmDeletion(
                        context, controller.usersList[index].userId),
                    child: Card(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 44,
                            backgroundColor: context.colorScheme.outline,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: context.colorScheme.secondary,
                              child: controller.usersList[index].profileImage ==
                                      ''
                                  ? SvgPicture.asset(
                                      ImagePath.proileAvatarSvg,
                                      height: 50,
                                      colorFilter: ColorFilter.mode(
                                          context.colorScheme.onSecondary,
                                          BlendMode.srcIn),
                                    )
                                  : ClipOval(
                                      child: Image.network(
                                      controller.usersList[index].profileImage,
                                      fit: BoxFit.cover,
                                      width: 80,
                                      height: 80,
                                    )),
                            ),
                          ).paddingAll(12),
                          const Spacer(),
                          SizedBox(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      text: '${LocaleKeys.profile_name.tr} ',
                                      fontSize: 16,
                                    ),
                                    CustomText(
                                        text: controller.usersList[index].name),
                                  ],
                                ).paddingOnly(right: 8),
                                Row(
                                  children: [
                                    Flexible(
                                      child: CustomText(
                                        text:
                                            '${LocaleKeys.admin_panel_email_text.tr}: ',
                                      ),
                                    ),
                                    CustomText(
                                        text: controller.usersList[index].email,
                                        color: context.colorScheme.secondary),
                                  ],
                                ),
                              ],
                            ),
                          ).paddingOnly(right: 8)
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}
