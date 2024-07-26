import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/presentation/admin_panel/controllers/admin_panel.controller.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:auto_parts_hub/domain/const/assets_paths.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/theme/text_size.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';

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
            color: colorScheme(context).onPrimary,
            borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(12))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * 0.24,
                    child: Stack(
                      children: [
                        Container(
                          height: height * 0.2,
                          decoration: BoxDecoration(
                            color: colorScheme(context).primary,
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(12)),
                          ),
                        ),
                        Positioned(
                            right: 10,
                            top: 10,
                            child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  color: colorScheme(context).primary,
                                  child: Icon(
                                    Icons.close,
                                    color: colorScheme(context).onPrimary,
                                    size: width * 0.048,
                                  ),
                                ))),
                        Positioned(
                          bottom: height * 0.01,
                          left: 15,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: width * 0.078,
                                backgroundColor: colorScheme(context).outline,
                                child: CircleAvatar(
                                  radius: width * 0.072,
                                  backgroundColor:
                                      colorScheme(context).secondary,
                                  child: StaticData.profileImage == ''
                                      ? SvgPicture.asset(
                                          ImagePath.proileAvatarSvg,
                                          height: width * 0.07,
                                          colorFilter: ColorFilter.mode(
                                              colorScheme(context).onPrimary,
                                              BlendMode.srcIn),
                                        )
                                      : ClipOval(
                                          child: Image.network(
                                          StaticData.profileImage,
                                          fit: BoxFit.cover,
                                          width: width * 0.36,
                                        )),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: StaticData.name,
                                    color: colorScheme(context).onPrimary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppTextSize.bodySmallFont,
                                  ),
                                  CustomText(
                                    text: StaticData.email,
                                    color: colorScheme(context).onPrimary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppTextSize.bodySmallFont,
                                  ),
                                ],
                              )
                            ],
                          ),
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
                            controller.drawerItems[index].title, context),
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
