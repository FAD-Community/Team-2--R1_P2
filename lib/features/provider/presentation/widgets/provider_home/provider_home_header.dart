import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ProviderHomeHeader extends StatelessWidget {
  const ProviderHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 52.w,
          height: 52.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryLight,
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            'assets/images/provider/profile_photo.png',
            fit: BoxFit.cover,
          ),
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Ahmed',
                style: AppTextStyle.font24MediumBlack,
              ),
              SizedBox(height: 2.h),
              Text(
                'Ready to take on your\nnext job?',
                style: AppTextStyle.font16RegularGrey,
              ),
            ],
          ),
        ),

        SvgPicture.asset(
          "assets/icons/bell-notification.svg",
          height: 28.h,
          width: 28.h,
        )

      ],
    );
  }
}