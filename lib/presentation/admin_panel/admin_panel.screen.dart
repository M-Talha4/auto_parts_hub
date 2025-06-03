import '/domain/const/static_data.dart';
import '/generated/locales.generated.dart';
import '/infrastructure/theme/text_size.dart';
import '/presentation/admin_panel/drawer/admin_panel_drawer.dart';
import '/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/admin_panel.controller.dart';
import '/domain/utils/context_extensions.dart';

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
                        color: context.colorScheme.primaryContainer),
                    children: [
                  TextSpan(
                    text: ' ${StaticData.name},',
                    style: TextStyle(
                        fontSize: AppTextSize.titleMediumFont,
                        color: context.colorScheme.secondary),
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
                      shadowColor: context.colorScheme.primary,
                      surfaceTintColor: context.colorScheme.primaryContainer,
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
                                  backgroundColor: context.colorScheme.secondary
                                      .withAlpha(15),
                                  child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor: context
                                          .colorScheme.secondary
                                          .withAlpha(51),
                                      child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: context
                                              .colorScheme.secondary
                                              .withAlpha(100),
                                          child: Icon(
                                            Icons.add,
                                            color:
                                                context.colorScheme.onPrimary,
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
