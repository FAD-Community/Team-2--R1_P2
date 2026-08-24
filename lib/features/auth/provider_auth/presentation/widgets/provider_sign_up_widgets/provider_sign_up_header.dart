import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/app_text_styles.dart';


class ProviderSignUpHeader extends StatelessWidget {
  const ProviderSignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Create New Account',
          style: AppTextStyle.font28SemiBoldBlack,
        ),

        SizedBox(height: 6.h),

        Text(
          'Create an account to get started',
          style: AppTextStyle.font18RegularSubtitle.copyWith(
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}