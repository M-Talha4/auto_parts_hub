import '../../../infrastructure/dal/services/firebase_services/user_services.dart';
import '/domain/utils/context_extensions.dart';

import '/presentation/admin_panel/controllers/admin_panel.controller.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '/domain/const/assets_paths.dart';
import '/generated/locales.generated.dart';
import '/infrastructure/theme/text_size.dart';
import '/presentation/widgets/custom_text.dart';

class AdminPanelDrawer extends GetView<AdminPanelController> {
  const AdminPanelDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: width * 0.75,
        height: height,
        decoration: BoxDecoration(
            color: context.colorScheme.onPrimary,
            borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(12))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 200,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(12)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: Container(
                            color: context.colorScheme.primary,
                            child: Icon(
                              Icons.close,
                              color: context.colorScheme.onPrimary,
                              size: width * 0.048,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: context.colorScheme.onPrimary,
                              child: Obx(() => CircleAvatar(
                                    radius: 25,
                                    backgroundColor:
                                        context.colorScheme.secondary,
                                    child: Get.find<UserServices>()
                                                .user
                                                .value
                                                .profileImage ==
                                            ''
                                        ? SvgPicture.asset(
                                            ImagePath.proileAvatarSvg,
                                            height: 35,
                                            colorFilter: ColorFilter.mode(
                                                context.colorScheme.onPrimary,
                                                BlendMode.srcIn),
                                          )
                                        : ClipOval(
                                            child: Image.network(
                                            Get.find<UserServices>()
                                                .user
                                                .value
                                                .profileImage,
                                            fit: BoxFit.cover,
                                            width: 50,
                                            height: 50,
                                          )),
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Obx(() => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: Get.find<UserServices>()
                                          .user
                                          .value
                                          .name,
                                      color: context.colorScheme.onPrimary,
                                      fontWeight: FontWeight.w500,
                                      fontSize: AppTextSize.bodySmallFont,
                                    ),
                                    CustomText(
                                      text: Get.find<UserServices>()
                                          .user
                                          .value
                                          .email,
                                      color: context.colorScheme.onPrimary,
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppTextSize.bodySmallFont,
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.6,
                    child: ListView.builder(
                      itemCount: controller.drawerItems.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ListTile(
                        onTap: () => controller.onTapDrawerItem(
                            controller.drawerItems[index].title),
                        minLeadingWidth: 4,
                        leading: Icon(controller.drawerItems[index].icon),
                        title: CustomText(
                          text: controller.drawerItems[index].title.tr,
                          fontSize: AppTextSize.bodyLargeFont,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: height * 0.12,
                alignment: Alignment.bottomLeft,
                child: InkWell(
                  onTap: () => controller.logout(),
                  child: ListTile(
                    title: CustomText(
                      text: LocaleKeys.drawer_logout_text.tr,
                      fontSize: AppTextSize.bodyMediumFont,
                    ),
                    leading: const Icon(Icons.exit_to_app),
                    minLeadingWidth: 4,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
