import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double? textSize;
  final double? letterSpacing;
  final double? borderRadius;
  final double? elevation;
  final Color? textColor;
  final FontWeight? fontWeight;
  final List<Color>? gradientColors;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final bool isIconRight;
  final Color? borderColor; // Added border color parameter
  final double? borderWidth; // Added border width parameter

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.elevation,
    this.textColor,
    this.fontWeight,
    this.textSize,
    this.letterSpacing,
    this.borderRadius,
    this.gradientColors,
    this.color,
    this.padding,
    this.width,
    this.height,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.isIconRight = false,
    this.borderColor, // Initialize border color parameter
    this.borderWidth, // Initialize border width parameter
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 53,
      width: width ?? MediaQuery.sizeOf(context).width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height ?? 45),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
            side:
                borderColor != null
                    ? BorderSide(color: borderColor!, width: borderWidth ?? 1.0)
                    : BorderSide.none,
          ),
          elevation: elevation ?? 0,
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
            border:
                borderColor != null
                    ? Border.all(color: borderColor!, width: borderWidth ?? 1.0)
                    : null,
          ),
          child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child:
                isIconRight
                    ? _buildTextWithIcon(context)
                    : _buildIconWithText(context),
          ),
        ),
      ),
    );
  }

  Widget _buildIconWithText(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            size: iconSize ?? 20,
            color: iconColor ?? Theme.of(context).colorScheme.onPrimary,
          ),
          const SizedBox(width: 8),
        ],
        Text(
          text,
          style: TextStyle(
            color: textColor ?? Theme.of(context).colorScheme.onPrimary,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: textSize ?? 17,
            letterSpacing: letterSpacing ?? 1.25,
          ),
        ),
      ],
    );
  }

  Widget _buildTextWithIcon(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            color: textColor ?? Theme.of(context).colorScheme.onPrimary,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: textSize ?? 14,
          ),
        ),
        if (icon != null) ...[
          const SizedBox(width: 8),
          Icon(
            icon,
            size: iconSize ?? 20,
            color: iconColor ?? Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      ],
    );
  }
}
