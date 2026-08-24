import 'package:fix_now_team_2/Features/Job_statues/Presentation/widgets/Status_Content.dart';
import 'package:fix_now_team_2/Features/Job_statues/Presentation/widgets/Status_Indicator.dart';
import 'package:fix_now_team_2/Features/Job_statues/data/Models/Job_Status_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobStatusItem extends StatelessWidget {
  final JobStatusModel status;
  final bool isCompleted;
  final bool isCurrent;
  final bool isLast;

  const JobStatusItem({
    super.key,
    required this.status,
    required this.isCompleted,
    required this.isCurrent,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StatusIndicator(
            isCompleted: isCompleted,
            isCurrent: isCurrent,
            isLast: isLast,
          ),

          SizedBox(width: 10.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 14.h),
              child: StatusContent(
                status: status,
                isCompleted: isCompleted,
                isCurrent: isCurrent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
