import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/presentation/dashboard/my_orders/controllers/my_orders.controller.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:auto_parts_hub/presentation/widgets/price_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetail extends GetView<MyOrdersController> {
  const OrderDetail({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    var order = controller.orderList[controller.selectedIndex];
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: LocaleKeys.order_order_detail_text.tr,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.keyboard_arrow_left,
              size: 26,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: 8),
          child: ListView.separated(
              itemCount: order.cartItems!.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(
                    height: height * 0.03,
                    thickness: 1,
                    color: colorScheme(context).secondary,
                  ),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: width * 0.3,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                          color: colorScheme(context).onSurface,
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                            image:
                                NetworkImage(order.cartItems![index].itemImage),
                            fit: BoxFit.fill,
                          )),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: order.cartItems![index].itemName,
                            fontSize: 16,
                            maxlines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          CustomText(
                            text: order.orderStatus!,
                            color: order.orderStatus == 'IN-PROCESS'
                                ? Colors.amber
                                : order.orderStatus == 'DELIVERD'
                                    ? colorScheme(context).secondary
                                    : colorScheme(context).error,
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: '${LocaleKeys.my_cart_amount_text.tr}: ',
                              ),
                              CustomText(
                                  text: order.cartItems![index].itemCount
                                      .toString(),
                                  color: colorScheme(context).secondary),
                            ],
                          ),
                          PriceText(
                              price: order.cartItems![index].itemPrice,
                              currency: LocaleKeys.my_cart_pkr_text.tr),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ));
  }
}
