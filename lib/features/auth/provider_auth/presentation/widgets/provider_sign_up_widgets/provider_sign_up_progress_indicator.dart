import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/app_colors.dart';

class ProviderSignUpProgressIndicator extends StatelessWidget {
  const ProviderSignUpProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 15.w,
          height: 15.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
        ),

        Expanded(
          child: Container(
            height: 1.h,
            color: Colors.black54,
          ),
        ),

        Container(
          width: 15.w,
          height: 15.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFD9D9D9),
          ),
        ),

        Expanded(
          child: Container(
            height: 1.h,
            color: Colors.black26,
          ),
        ),

        Container(
          width: 15.w,
          height: 15.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFD9D9D9),
          ),
        ),
      ],
    );
  }
}