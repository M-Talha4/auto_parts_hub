import '/generated/locales.generated.dart';
import '/infrastructure/theme/text_size.dart';
import '/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'controllers/manage_orders.controller.dart';
import 'module/order_tab_body.dart';
import 'package:get/get.dart';

class ManageOrdersScreen extends GetView<ManageOrdersController> {
  const ManageOrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: LocaleKeys.admin_panel_manage_orders_text.tr,
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: AppTextSize.displayMediumFont,
              )),
          bottom: TabBar(
            controller: controller.tabController,
            tabs: [
              Tab(text: LocaleKeys.order_order_in_process.tr),
              Tab(text: LocaleKeys.order_order_delivered.tr),
              Tab(text: LocaleKeys.order_order_cancelled.tr),
            ],
          ),
        ),
        body: TabBarView(controller: controller.tabController, children: const [
          OrderTabBody(status: 'IN-PROCESS'),
          OrderTabBody(status: 'DELIVERD'),
          OrderTabBody(status: 'CANCELLED'),
        ]));
  }
}
