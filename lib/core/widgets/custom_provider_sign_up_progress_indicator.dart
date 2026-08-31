import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProviderSignUpProgressIndicator extends StatelessWidget {
  final int currentStep;

  const CustomProviderSignUpProgressIndicator({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildStep(1),
        _buildLine(1),
        _buildStep(2),
        _buildLine(2),
        _buildStep(3),
      ],
    );
  }

  Widget _buildStep(int step) {
    final bool isActive = step <= currentStep;

    return Container(
      width: 15.w,
      height: 15.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? AppColors.primary
            : AppColors.primaryLight,
      ),
    );
  }

  Widget _buildLine(int line) {
    final bool isActive = line < currentStep;

    return Expanded(
      child: Container(
          height: 1.5.h,
          color: isActive
              ? AppColors.primary
              : AppColors.line
      ),
    );
  }
}