import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/theme/text_size.dart';
import 'package:auto_parts_hub/presentation/admin_panel/modules/manage_orders/controllers/manage_orders.controller.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'tile_cart_items.dart';

class OrderTabBody extends GetView<ManageOrdersController> {
  final String status;
  const OrderTabBody({super.key, required this.status});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: 8),
      child: Obx(
        () => ListView.builder(
            itemCount: controller.orderList
                .where((order) => order.orderStatus == status)
                .length,
            itemBuilder: (context, index) {
              return Card(
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: CustomText(
                        text: controller.orderList
                            .where((order) => order.orderStatus == status)
                            .toList()[index]
                            .customerEmail!),
                    children: [
                      TileCartItems(
                              order: controller.orderList
                                  .where((order) => order.orderStatus == status)
                                  .toList()[index])
                          .paddingAll(8.0),
                      status != 'DELIVERD'
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                if (status != 'CANCELLED')
                                  ElevatedButton(
                                      onPressed: () =>
                                          controller.onOrderStatusChange(
                                              controller.orderList
                                                  .where((order) =>
                                                      order.orderStatus ==
                                                      status)
                                                  .toList()[index]
                                                  .orderId!,
                                              'CANCELLED'),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              colorScheme(context).error),
                                      child: CustomText(
                                          text: LocaleKeys.button_cancel.tr)),
                                ElevatedButton(
                                    onPressed: () => controller
                                        .onOrderStatusChange(
                                            controller
                                                .orderList
                                                .where((order) =>
                                                    order.orderStatus == status)
                                                .toList()[index]
                                                .orderId!,
                                            status == 'CANCELLED'
                                                ? 'IN-PROCESS'
                                                : 'DELIVERD'),
                                    child: CustomText(
                                        text: LocaleKeys.button_accept.tr))
                              ],
                            ).paddingOnly(bottom: 8, left: 4, right: 4)
                          : Center(
                              child: CustomText(
                              text: LocaleKeys.order_order_delivered.tr,
                              color: colorScheme(context).primary,
                              fontSize: AppTextSize.bodyLargeFont,
                            )).paddingOnly(bottom: 8, left: 8, right: 8),
                    ],
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
