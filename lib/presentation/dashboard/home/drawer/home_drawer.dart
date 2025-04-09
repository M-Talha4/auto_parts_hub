import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:auto_parts_hub/domain/const/assets_paths.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/theme/text_size.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:auto_parts_hub/presentation/dashboard/home/controllers/home.controller.dart';

class HomeDrawer extends GetView<HomeController> {
  const HomeDrawer({super.key});

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
                  Container(
                    height: 200,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colorScheme(context).primary,
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
                            color: colorScheme(context).primary,
                            child: Icon(
                              Icons.close,
                              color: colorScheme(context).onPrimary,
                              size: width * 0.048,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: colorScheme(context).onPrimary,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: colorScheme(context).secondary,
                                child: StaticData.profileImage == ''
                                    ? SvgPicture.asset(
                                        ImagePath.proileAvatarSvg,
                                        height: 35,
                                        colorFilter: ColorFilter.mode(
                                            colorScheme(context).onPrimary,
                                            BlendMode.srcIn),
                                      )
                                    : ClipOval(
                                        child: Image.network(
                                        StaticData.profileImage,
                                        fit: BoxFit.cover,
                                        width: 50,
                                        height: 50,
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
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppTextSize.bodySmallFont,
                                ),
                              ],
                            )
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
