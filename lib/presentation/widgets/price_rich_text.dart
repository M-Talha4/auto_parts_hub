import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  final int price;
  final String currency;
  final Color? priceColor;
  final Color? currenyColor;
  final double? fontSize;
  final FontStyle? fontstyle;
  final FontWeight? fontWeight;

  const PriceText({
    super.key,
    required this.price,
    required this.currency,
    this.priceColor,
    this.currenyColor,
    this.fontSize,
    this.fontWeight,
    this.fontstyle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: price.toString(),
            style: TextStyle(
              color: priceColor ?? Colors.amber,
              fontSize: fontSize ?? 16,
              fontStyle: fontstyle,
              fontWeight: fontWeight,
            ),
            children: [
          TextSpan(
            text: ' $currency',
            style: TextStyle(
              color: currenyColor ?? colorScheme(context).onSurface,
              fontSize: fontSize ?? 16,
              fontStyle: fontstyle,
              fontWeight: fontWeight,
            ),
          )
        ]));
  }
}
