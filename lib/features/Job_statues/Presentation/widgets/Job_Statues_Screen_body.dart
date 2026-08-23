import 'package:fix_now_team_2/Features/Job_statues/Presentation/widgets/Job_Status_Timeline.dart';
import 'package:fix_now_team_2/Features/Job_statues/Presentation/widgets/information_container.dart';
import 'package:fix_now_team_2/Features/Job_statues/Presentation/widgets/service_provider_container.dart';
import 'package:fix_now_team_2/Features/Job_statues/data/Models/Job_Status_Model.dart';
import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:fix_now_team_2/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobStatuesScreenBody extends StatelessWidget {
  const JobStatuesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InformationContainer(),
          SizedBox(height: 12.h),
          ServiceProviderContinar(),
          SizedBox(height: 12.h),
          Text(
            'Job Status',
            style: AppTextStyle.font24MediumPrimary.copyWith(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12.h),

          JobStatusTimeline(currentStatus: JobStatus.inProgress),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  borderColor: AppColors.warning,
                  backgroundColor: Colors.white,
                  onPressed: () {},
                  child: Text(
                    'Cancel Job',
                    style: AppTextStyle.font20SemiBoldWhite.copyWith(
                      color: AppColors.warning,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: CustomElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Update Status',
                    style: AppTextStyle.font20SemiBoldWhite,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
