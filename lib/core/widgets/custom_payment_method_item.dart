import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPaymentMethodItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final bool isSelected;
  final VoidCallback? onTap;

  const CustomPaymentMethodItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        height: 64.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.primaryLight,
          ),
        ),
        child: Row(
          children: [
            icon,

            SizedBox(width: 14.w),

            Expanded(
              child: Text(
                title,
                style: AppTextStyle.font16MediumLabelGrey,
              ),
            ),

            Container(
              width: 22.w,
              height: 22.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.primaryLight,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? Center(
                child: Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                ),
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}