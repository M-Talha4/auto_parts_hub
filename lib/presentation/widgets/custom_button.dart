import 'package:flutter/material.dart';
import '../../domain/const/global_variable.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final double? width;
  final double? height;
  final bool isBig;
  final Color? bgcolor;
  final Color? shadowcolor;
  final Color? txtcolor;
  final FontWeight? fontWeight;
  final double? textsize;
  final double? borderradius;

  const CustomButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.width,
      this.height,
      this.isBig = true,
      this.bgcolor,
      this.shadowcolor,
      this.txtcolor,
      this.fontWeight,
      this.textsize,
      this.borderradius});

  @override
  Widget build(BuildContext context) {
    final width1 = MediaQuery.of(context).size.width;

    return InkWell(
      splashColor: colorScheme(context).primary,
      onTap: onTap,
      child: Container(
        width: isBig ? 360 : width ?? 120,
        height: height ?? 45,
        decoration: BoxDecoration(
            boxShadow: const [
              // BoxShadow(
              //     offset: const Offset(0, 3),
              //     blurRadius: 7,
              //     spreadRadius: 5,
              //     color: shadowcolor ?? AppColors.grey.withOpacity(0.5))
            ],
            borderRadius: BorderRadius.circular(
                isBig ? width1 * 0.01 : borderradius ?? width1 * 0.04),
            color: bgcolor ?? colorScheme(context).primary),
        child: Center(
          child: SizedBox(
            width: width1 * 0.4,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: txtcolor ?? colorScheme(context).onPrimary,
                  fontWeight: fontWeight ?? FontWeight.w600,
                  fontSize: textsize ?? 16),
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final bool isLoading;
  final double? width;
  final double? height;
  final bool isBig;
  final Color? bgcolor;
  final Color? shadowcolor;
  final Color? txtcolor;
  final FontWeight? fontWeight;
  final double? textsize;
  final double? borderradius;

  const LoadingButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.isLoading,
      this.width,
      this.height,
      this.isBig = true,
      this.bgcolor,
      this.shadowcolor,
      this.txtcolor,
      this.fontWeight,
      this.textsize,
      this.borderradius});

  @override
  Widget build(BuildContext context) {
    final width1 = MediaQuery.of(context).size.width;

    return InkWell(
      splashColor: colorScheme(context).primary,
      onTap: onTap,
      child: Container(
        width: isBig ? width1 : width ?? width1 * 0.35,
        height: height ?? 45,
        decoration: BoxDecoration(
            boxShadow: const [
              // BoxShadow(
              //     offset: const Offset(0, 3),
              //     blurRadius: 7,
              //     spreadRadius: 5,
              //     color: shadowcolor ?? AppColors.grey.withOpacity(0.5))
            ],
            borderRadius: BorderRadius.circular(borderradius ?? 4),
            color: bgcolor ?? colorScheme(context).primary),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: height != null ? height! * 0.66 : 25.5,
                  width: height != null ? height! * 0.66 : 25.5,
                  child: CircularProgressIndicator(
                    color: colorScheme(context).onPrimary,
                    backgroundColor: colorScheme(context).primary,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                      color: txtcolor ?? colorScheme(context).onPrimary,
                      fontWeight: fontWeight ?? FontWeight.bold,
                      fontSize: textsize ?? width1 * 0.038),
                ),
        ),
      ),
    );
  }
}
