import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle font20MediumBlack = TextStyle(
    fontSize: 20.sp,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font20MediumBlackOpacity = TextStyle(
    fontSize: 20.sp,
    color: const Color(0xB3000000),
    fontWeight: FontWeight.w500,
  );

  static TextStyle font12MediumBlack = TextStyle(
    fontSize: 12.sp,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font12RegularBlack = TextStyle(
    fontSize: 12.sp,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );

  static TextStyle font16MediumBlack = TextStyle(
    fontSize: 16.sp,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font24SemiBoldPrimary = TextStyle(
    fontSize: 24.sp,
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font24SemiBoldWhite = TextStyle(
    fontSize: 24.sp,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font20SemiBoldWhite = TextStyle(
    fontSize: 20.sp,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font12RegularGrey = TextStyle(
    fontSize: 12.sp,
    color: const Color(0xFF757575),
    fontWeight: FontWeight.normal,
  );
}