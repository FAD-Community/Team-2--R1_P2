import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'over_view_card.dart';


class ProviderOverviewSection extends StatelessWidget {
  const ProviderOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Overview',
          style: AppTextStyle.font24MediumBlack,
        ),

        SizedBox(height: 12.h),

        Row(
          children: [
            Expanded(
              child: OverviewCard(
                iconPath: 'assets/icons/requests_icon.svg',
                value: '3',
                title: 'New Requests',
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: OverviewCard(
                iconPath: 'assets/icons/upcoming_icon.svg',
                value: '4',
                title: 'Upcoming Jobs',
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: OverviewCard(
                iconPath: 'assets/icons/icons_check.svg',
                value: '16',
                title: 'Completed',
              ),
            ),
          ],
        ),
      ],
    );
  }
}