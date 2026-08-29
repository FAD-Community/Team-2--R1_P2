import 'package:fix_now_team_2/constants/assets.dart';
import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSplashPhoto extends StatelessWidget {
  const CustomSplashPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 0,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            clipBehavior: Clip.none,
            height: 250.h,
            width: 250.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(Assets.imagesSplash),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Fix",
              style: TextStyle(
                color: AppColors.primaryLight,
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              "Now",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
