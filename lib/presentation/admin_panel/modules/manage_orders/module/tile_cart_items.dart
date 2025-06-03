import '/domain/utils/context_extensions.dart';

import '/domain/core/entities/order_entities/order_entity.dart';
import '/generated/locales.generated.dart';
import '/presentation/widgets/custom_text.dart';
import '/presentation/widgets/price_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class TileCartItems extends StatelessWidget {
  final OrdersEntity order;
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
              color: context.colorScheme.secondary,
            ),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: width * 0.3,
                width: width * 0.3,
                decoration: BoxDecoration(
                    color: context.colorScheme.onSurface,
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
                              ? context.colorScheme.secondary
                              : context.colorScheme.error,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: '${LocaleKeys.my_cart_amount_text.tr}: ',
                        ),
                        CustomText(
                            text: order.cartItems![index].itemCount.toString(),
                            color: context.colorScheme.secondary),
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
