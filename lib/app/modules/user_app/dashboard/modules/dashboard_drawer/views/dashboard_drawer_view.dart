import '/consts/const.dart';
import '/consts/static_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/widgets/custom_text.dart';
import '/consts/app_color.dart';
import '../controllers/dashboard_drawer_controller.dart';

class DashboardDrawerView extends GetView<DashboardDrawerController> {
  const DashboardDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardDrawerController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: width * 0.75,
        height: height,
        decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(12))),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.24,
              child: Stack(
                children: [
                  Container(
                    height: height * 0.2,
                    decoration: const BoxDecoration(
                      color: AppColor.primary,
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(12)),
                    ),
                  ),
                  Positioned(
                      right: 5,
                      top: 5,
                      child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            color: AppColor.primary,
                            child: Icon(
                              Icons.close,
                              color: AppColor.grey,
                              size: width * 0.045,
                            ),
                          ))),
                  Positioned(
                    bottom: height * 0.01,
                    left: 15,
                    child: Container(
                      width: width * 0.165,
                      height: width * 0.165,
                      decoration: BoxDecoration(
                        color: AppColor.primaryLight,
                        border: Border.all(width: 1, color: AppColor.grey),
                        borderRadius: BorderRadius.circular(width * 0.2),
                      ),
                      child: Icon(
                        Icons.person_outline,
                        size: width * 0.08,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: height * 0.055,
                      left: width * 0.22,
                      child: CustomText(
                        text: StaticData.name,
                        color: AppColor.white,
                        fontSize: width * 0.038,
                      ))
                ],
              ),
            ),
            ListView.builder(
              itemCount: controller.drawerItems.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                onTap: () => controller.onTapDrawerItem(
                    controller.drawerItems[index].title, context),
                minLeadingWidth: 4,
                leading: Icon(controller.drawerItems[index].icon),
                title: CustomText(
                  text: controller.drawerItems[index].title,
                  fontSize: width * 0.038,
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                // firebaseAuth.signOut();
                // Get.offAllNamed(Routes.login);
              },
              child: ListTile(
                title: CustomText(
                  text: logoutText,
                  fontSize: width * 0.038,
                ),
                leading: const Icon(Icons.exit_to_app),
                minLeadingWidth: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
