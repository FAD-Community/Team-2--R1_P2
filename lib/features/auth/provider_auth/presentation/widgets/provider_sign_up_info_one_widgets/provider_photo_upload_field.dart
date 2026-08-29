import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProviderPhotoUploadField extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const ProviderPhotoUploadField({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        height: 86.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.primaryLight),
        ),
        child: Row(
          children: [
            Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(6.w),
                child: SvgPicture.asset(
                  'assets/icons/camera_icon.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(text, style: AppTextStyle.font16MediumLabelGrey),
            ),
          ],
        ),
      ),
    );
  }
}
