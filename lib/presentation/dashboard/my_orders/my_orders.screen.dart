import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/my_orders.controller.dart';
import 'module/tab_body.dart';

class MyOrdersScreen extends GetView<MyOrdersController> {
  const MyOrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: LocaleKeys.drawer_my_orders_text.tr,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.keyboard_arrow_left,
              size: 26,
            ),
          ),
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
          TabBody(status: 'IN-PROCESS'),
          TabBody(status: 'DELIVERD'),
          TabBody(status: 'CANCELLED'),
        ]));
  }
}
