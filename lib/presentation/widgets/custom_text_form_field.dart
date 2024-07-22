import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final int? maxline;
  final int? maxLength;
  final double? height;
  final double? hintSize;
  final double? borderradius;
  final double? borderwidth;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? focusborderwidth;
  final String? hint;
  final String? label;
  final bool? showlabel;
  final bool? obscureText;
  final bool filled;
  final bool? isCollapsed;
  final bool? isDense;
  final bool? isEnabled;
  final bool? readOnly;
  final Color? fillColor;
  final Color? hintcolor;
  final Color? labelcolor;
  final Color? inputcolor;
  final Color? bordercolor;
  final Color? focusbordercolor;
  final Color? cursorcolor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextInputType? keyboardtype;
  final TextInputAction? inputaction;
  final AutovalidateMode? autoValidateMode;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validation;

  const CustomTextFormField({
    super.key,
    this.maxline,
    this.maxLength,
    this.height,
    this.hintSize,
    this.borderradius,
    this.borderwidth,
    this.horizontalPadding,
    this.verticalPadding,
    this.focusborderwidth,
    this.hint,
    this.label,
    this.showlabel,
    this.obscureText,
    this.filled = true,
    this.isCollapsed,
    this.isDense,
    this.isEnabled,
    this.readOnly,
    this.fillColor,
    this.hintcolor,
    this.labelcolor,
    this.inputcolor,
    this.bordercolor,
    this.focusbordercolor,
    this.cursorcolor,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    this.keyboardtype,
    this.inputaction,
    this.autoValidateMode,
    this.onTap,
    this.onChanged,
    this.controller,
    this.validation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 3,
            color: colorScheme(context).outline.withOpacity(0.3),
            offset: const Offset(2, 4))
      ]),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        maxLength: maxLength,
        obscureText: obscureText ?? false,
        cursorColor: cursorcolor ?? colorScheme(context).onSurface,
        maxLines: /*obscureText == true ? 1 :*/ maxline ?? 1,
        textInputAction: inputaction,
        style: TextStyle(
          color: inputcolor,
          fontSize: 16,
        ),
        autofocus: false,
        keyboardType: keyboardtype,
        onChanged: onChanged,
        autovalidateMode: autoValidateMode ?? AutovalidateMode.disabled,
        readOnly: readOnly ?? false,
        enabled: isEnabled ?? true,
        decoration: InputDecoration(
          counterText: '',
          hintText: showlabel ?? false ? null : hint,
          label: showlabel ?? false
              ? Text(
                  label!,
                  style: TextStyle(
                    color: labelcolor,
                  ),
                )
              : null,
          hintStyle: TextStyle(
              color: hintcolor ?? colorScheme(context).outline, fontSize: 14),
          filled: filled,
          fillColor: isEnabled == false
              ? colorScheme(context).outlineVariant
              : colorScheme(context).surface,
          // : filled
          //     ? fillColor
          //     : AppColors.transparent,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 20.0,
              vertical: verticalPadding ?? 10),
          errorMaxLines: 2,
          isCollapsed: isCollapsed ?? false,
          isDense: isDense,
          // Border States
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: bordercolor ?? colorScheme(context).outlineVariant,
                  width: borderwidth ?? 1),
              borderRadius: BorderRadius.circular(borderradius ?? 8)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: focusbordercolor ?? colorScheme(context).secondary,
              width: focusborderwidth ?? 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorScheme(context).error,
              width: focusborderwidth ?? 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorScheme(context).error,
              width: focusborderwidth ?? 2,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorScheme(context).outline,
              width: focusborderwidth ?? 2,
            ),
          ),
        ),
        validator: validation,
      ),
    );
  }
}

class VerifyCodeField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String)? onChanged;

  const VerifyCodeField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      validator: (value) {
        if (value == '' || value == null) {
          return '';
        }
        return null;
      },
      maxLength: 1,
      cursorColor: colorScheme(context).primary,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: colorScheme(context).primary, width: 2)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: colorScheme(context).primary.withOpacity(0.6),
                  width: 2))),
    );
  }
}
