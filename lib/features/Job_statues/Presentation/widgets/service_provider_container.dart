import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceProviderContinar extends StatelessWidget {
  const ServiceProviderContinar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      width: double.infinity,

      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border, width: 2),
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 55.w,
            height: 55.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/peson_image.avif'),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mohamed Ahmed',
                style: AppTextStyle.font16MediumLabelGrey.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Icon(
                    size: 20,
                    Icons.star_border_outlined,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '4.8',
                    style: AppTextStyle.font12RegularGrey.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '(30 reviews)',
                    style: AppTextStyle.font12RegularGrey.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          // SizedBox(width: 12.w),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: AppColors.infoLight,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(Icons.call, color: AppColors.primary),
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: AppColors.infoLight,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(Icons.chat_bubble_rounded, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
