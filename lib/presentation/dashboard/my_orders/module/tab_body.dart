import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/presentation/dashboard/my_orders/controllers/my_orders.controller.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:auto_parts_hub/presentation/widgets/price_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBody extends GetView<MyOrdersController> {
  final String status;
  const TabBody({super.key, required this.status});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: 8),
      child: Obx(
        () => ListView.separated(
            itemCount: controller.orderList
                .where((order) => order.orderStatus == status)
                .length,
            shrinkWrap: true,
            separatorBuilder: (context, index) => Divider(
                  height: height * 0.03,
                  thickness: 1,
                  color: colorScheme(context).secondary,
                ),
            itemBuilder: (context, index) {
              var list = controller.orderList
                  .where((order) => order.orderStatus == status)
                  .toList();
              return InkWell(
                onTap: () => controller.getDetails(index),
                child: Row(
                  children: [
                    Container(
                      height: width * 0.25,
                      width: width * 0.25,
                      decoration: BoxDecoration(
                          color: colorScheme(context).onSurface,
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                            image: NetworkImage(
                                list[index].cartItems![0].itemImage),
                            fit: BoxFit.fill,
                          )),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: list[index].cartItems![0].itemName,
                            fontSize: 16,
                            maxlines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          CustomText(
                            text: list[index].orderStatus!,
                            color: status == 'IN-PROCESS'
                                ? Colors.amber
                                : status == 'DELIVERD'
                                    ? colorScheme(context).secondary
                                    : colorScheme(context).error,
                          ),
                          PriceText(
                              price: list[index].orderPrice!,
                              currency: LocaleKeys.my_cart_pkr_text.tr),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    ));
  }
}
