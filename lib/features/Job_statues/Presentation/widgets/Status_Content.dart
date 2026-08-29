import 'package:fix_now_team_2/Features/Job_statues/Presentation/widgets/Status_Label.dart';
import 'package:fix_now_team_2/Features/Job_statues/data/Models/Job_Status_Model.dart';
import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusContent extends StatelessWidget {
  final JobStatusModel status;
  final bool isCompleted;
  final bool isCurrent;

  const StatusContent({
    required this.status,
    required this.isCompleted,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                status.title,
                style: AppTextStyle.font16MediumLabelGrey,
              ),
            ),

            if (isCompleted)
              StatusLabel(text: 'Completed', color: Colors.green),

            if (isCurrent)
              StatusLabel(text: 'In Progress', color: AppColors.primary),
          ],
        ),

        if (status.subtitle != null) ...[
          SizedBox(height: 3.h),

          Text(
            status.subtitle!,
            style: TextStyle(fontSize: 11.sp, color: Colors.grey),
          ),
        ],
      ],
    );
  }
}
