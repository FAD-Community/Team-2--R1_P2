import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_styles.dart';

class ProviderAvailabilitySection extends StatefulWidget {
  const ProviderAvailabilitySection({super.key});

  @override
  State<ProviderAvailabilitySection> createState() =>
      _ProviderAvailabilitySectionState();
}

class _ProviderAvailabilitySectionState
    extends State<ProviderAvailabilitySection> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You're Available",
                style: AppTextStyle.font20SemiBoldBlack,
              ),
              SizedBox(height: 8.h),
              Text(
                'You can receive new service request',
                style: AppTextStyle.font14RegularBlack,
              ),
            ],
          ),
        ),

        GestureDetector(
          onTap: () {
            setState(() {
              isAvailable = !isAvailable;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 60.w,
            height: 28.h,
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              color: isAvailable
                  ? AppColors.primary
                  : AppColors.textDisabled,
              borderRadius: BorderRadius.circular(20.r),
            ),
            alignment: isAvailable
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              width: 22.w,
              height: 22.h,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        )
      ],
    );
  }
}