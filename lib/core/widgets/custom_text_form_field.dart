import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String? label;
  final Color fillColor;
  final Color? textColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.fillColor,
    this.textColor,
    required this.borderColor,
    required this.focusedBorderColor,
    this.textStyle,
    this.hintStyle,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      style: textStyle ?? TextStyle(color: textColor, fontSize: 14.sp),
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: hintStyle ?? AppTextStyle.font16MediumLabelGrey,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: borderColor),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),

          borderSide: BorderSide(color: borderColor),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),

          borderSide: BorderSide(color: focusedBorderColor),
        ),
      ),
    );
  }
}
