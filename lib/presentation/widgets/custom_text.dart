import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? bgcolor;
  final Color? decorationColor;
  final double? fontSize;
  final double? letterspacing;
  final double? wordspacing;
  final int? maxlines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final FontStyle? fontstyle;
  final TextDecorationStyle? decorationStyle;
  final FontWeight? fontWeight;

  const CustomText(
      {super.key,
      required this.text,
      this.color,
      this.bgcolor,
      this.decorationColor,
      this.fontSize,
      this.maxlines,
      this.letterspacing,
      this.wordspacing,
      this.overflow,
      this.decoration,
      this.fontWeight,
      this.fontstyle,
      this.decorationStyle,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxlines,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          backgroundColor: bgcolor,
          decoration: decoration,
          overflow: overflow,
          letterSpacing: letterspacing,
          wordSpacing: wordspacing,
          fontStyle: fontstyle,
          color: color,
          decorationStyle: decorationStyle,
          decorationColor: decorationColor),
    );
  }
}
