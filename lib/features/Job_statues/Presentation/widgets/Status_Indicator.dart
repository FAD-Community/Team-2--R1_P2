import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusIndicator extends StatelessWidget {
  final bool isCompleted;
  final bool isCurrent;
  final bool isLast;

  const StatusIndicator({
    super.key,
    required this.isCompleted,
    required this.isCurrent,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.w,
      child: Column(
        children: [
          Container(
            width: 16.w,
            height: 16.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted ? AppColors.primary : Colors.white,
              border: Border.all(
                color: isCompleted || isCurrent
                    ? AppColors.primary
                    : AppColors.primary.withOpacity(0.4),
                width: 1,
              ),
            ),
            child: isCompleted
                ? Icon(Icons.check, size: 11.sp, color: Colors.white)
                : isCurrent
                ? Center(
                    child: Container(
                      width: 8.w,
                      height: 8.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                    ),
                  )
                : null,
          ),

          if (!isLast)
            Expanded(
              child: Container(
                width: 1,
                color: AppColors.primary.withOpacity(0.25),
              ),
            ),
        ],
      ),
    );
  }
}
