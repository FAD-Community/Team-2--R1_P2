import 'package:fix_now_team_2/Features/Job_statues/Presentation/widgets/Job_Status_Item.dart';
import 'package:fix_now_team_2/Features/Job_statues/data/Models/Job_Status_Model.dart';
import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobStatusTimeline extends StatelessWidget {
  final JobStatus currentStatus;

  const JobStatusTimeline({super.key, required this.currentStatus});

  @override
  Widget build(BuildContext context) {
    final currentIndex = JobStatuses.all.indexWhere(
      (status) => status.status == currentStatus,
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        children: List.generate(JobStatuses.all.length, (index) {
          final status = JobStatuses.all[index];

          return JobStatusItem(
            status: status,
            isCompleted: index < currentIndex,
            isCurrent: index == currentIndex,
            isLast: index == JobStatuses.all.length - 1,
          );
        }),
      ),
    );
  }
}
