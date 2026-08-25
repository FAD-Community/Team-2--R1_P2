import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/features/onboarding/data/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel onboardingModel;
  const OnboardingItem({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 285.h,
              width: double.infinity,
              child: Image.asset(onboardingModel.image, fit: BoxFit.contain),
            ),
          ),
          SizedBox(height: 25.h),
          // Content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Circular Icon
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    color: onboardingModel.iconBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    onboardingModel.icon,
                    color: AppColors.white,
                    size: 27.sp,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        onboardingModel.title,
                        style: TextStyle(
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        onboardingModel.description,
                        style: TextStyle(
                          fontSize: 16.sp,
                          height: 1.25,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
