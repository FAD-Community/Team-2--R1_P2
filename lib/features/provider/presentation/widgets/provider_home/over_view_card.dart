import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class OverviewCard extends StatelessWidget {
  final String iconPath;
  final String value;
  final String title;

  const OverviewCard({
    required this.iconPath,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.primaryLight,
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 9.h,horizontal: 3.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 42.w,
              height: 42.h,
              decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ),

            SizedBox(height: 4.h),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$value ',
                    style: AppTextStyle.font12MediumPrimary
                  ),
                  TextSpan(
                    text: title,
                    style: AppTextStyle.font12MediumPrimary
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}