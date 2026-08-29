import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class CustomOtpPinput extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onCompleted;

  const CustomOtpPinput({
    super.key,
    required this.controller,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: controller,
      length: 4,
      defaultPinTheme: PinTheme(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        width: 55,
        height: 55,
        textStyle: TextStyle(fontSize: 18.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            width: .4,
            color: Colors.grey.withValues(alpha: .6),
          ),
        ),
      ),
      focusedPinTheme: PinTheme(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        width: 55,
        height: 55,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.primaryLight, width: 2),
        ),
      ),
      submittedPinTheme: PinTheme(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        width: 55,
        height: 55,
        textStyle: TextStyle(fontSize: 18.sp),
        decoration: BoxDecoration(
          color: AppColors.primaryLight.withValues(alpha: .8),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.primaryLight, width: 2),
        ),
      ),
      onCompleted: onCompleted,
    );
  }
}
