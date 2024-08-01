import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/theme/text_size.dart';
import 'package:auto_parts_hub/presentation/admin_panel/drawer/admin_panel_drawer.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/admin_panel.controller.dart';

class AdminPanelScreen extends GetView<AdminPanelController> {
  const AdminPanelScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.admin_panel_admin_panel_text.tr),
        ),
        drawer: const AdminPanelDrawer(),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            RichText(
                text: TextSpan(
                    text: LocaleKeys.admin_panel_welcome_text.tr,
                    style: TextStyle(
                        fontSize: AppTextSize.titleSmallFont,
                        color: colorScheme(context).primaryContainer),
                    children: [
                  TextSpan(
                    text: ' ${StaticData.name},',
                    style: TextStyle(
                        fontSize: AppTextSize.titleMediumFont,
                        color: colorScheme(context).secondary),
                  )
                ])).paddingOnly(left: 16, top: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: controller.adminPanelItems.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  int lastItemIndex = controller.adminPanelItems.length - 1;
                  return InkWell(
                    onTap: () => controller.onTapPanelItem(
                        controller.adminPanelItems[index].title),
                    child: Card(
                      shadowColor: colorScheme(context).primary,
                      surfaceTintColor: colorScheme(context).primaryContainer,
                      child: index != lastItemIndex
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Image.asset(
                                      controller.adminPanelItems[index].image),
                                ),
                                CustomText(
                                        text: controller
                                            .adminPanelItems[index].title.tr)
                                    .paddingSymmetric(horizontal: 6)
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: colorScheme(context)
                                      .secondary
                                      .withOpacity(0.05),
                                  child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor: colorScheme(context)
                                          .secondary
                                          .withOpacity(0.2),
                                      child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: colorScheme(context)
                                              .secondary
                                              .withOpacity(0.4),
                                          child: Icon(
                                            Icons.add,
                                            color:
                                                colorScheme(context).onPrimary,
                                          ))),
                                ),
                                CustomText(
                                        text: controller
                                            .adminPanelItems[index].title.tr)
                                    .paddingSymmetric(horizontal: 6)
                              ],
                            ),
                    ),
                  );
                },
              ),
            )
          ]),
        ));
  }
}
