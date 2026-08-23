import 'package:fix_now_team_2/Features/Job_statues/Presentation/widgets/date_widget.dart';
import 'package:fix_now_team_2/Features/Job_statues/Presentation/widgets/location_wigdet.dart';
import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationContainer extends StatelessWidget {
  const InformationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
      width: double.infinity,

      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border, width: 2),
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text("Water Leakage", style: AppTextStyle.font18RegularSubtitle),
              SizedBox(width: 80.w),

              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.infoLight,
                ),
                child: Text(
                  "in progress",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              LocationWidget(),
              SizedBox(width: 80.w),
              Container(width: 1, height: 35.h, color: Colors.grey),
              SizedBox(width: 8.w),
              DateWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
