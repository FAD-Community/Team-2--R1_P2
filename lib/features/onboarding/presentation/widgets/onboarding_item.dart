import 'package:fix_now_team_2/features/onboarding/data/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel onboardingModel;

  const OnboardingItem({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    color: onboardingModel.iconBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    onboardingModel.icon,
                    color: theme.colorScheme.onPrimary,
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
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        onboardingModel.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 16.sp,
                          height: 1.25,
                          fontWeight: FontWeight.w400,
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
