import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/domain/core/entities/order_entities/order.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_text.dart';
import 'package:auto_parts_hub/presentation/widgets/price_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class TileCartItems extends StatelessWidget {
  final Orders order;
  const TileCartItems({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return ListView.separated(
        itemCount: order.cartItems!.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
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
                      image: NetworkImage(order.cartItems![index].itemImage),
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
                            text: order.cartItems![index].itemCount.toString(),
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
        });
  }
}
