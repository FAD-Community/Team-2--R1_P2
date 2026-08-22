import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.calendar_month_outlined, color: AppColors.textSecondary),
            SizedBox(width: 4.w),
            Text('Sep 20, 2026', style: AppTextStyle.font12RegularGrey),
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            Icon(Icons.access_time, color: AppColors.textSecondary),
            SizedBox(width: 4.w),
            Text('10:00 AM', style: AppTextStyle.font12RegularGrey),
          ],
        ),
      ],
    );
  }
}
