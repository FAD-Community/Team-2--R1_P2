import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../data/models/provider_request_dummy_model.dart';

class ProviderRequestCard extends StatelessWidget {
  final ProviderRequestDummyModel request;

  const ProviderRequestCard({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28.w,
                height: 28.h,
                decoration: BoxDecoration(
                  color: AppColors.backgroundScaffold,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    request.iconPath,
                    width: 18.w,
                    height: 18.h,
                  ),
                ),
              ),

              SizedBox(width: 4.w),

              Expanded(
                child: Text(
                  request.serviceName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.font16MediumLabelGrey.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),

          SizedBox(height: 8.h),

          Text(
            request.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.font12RegularGrey,
          ),

          SizedBox(height: 8.h),

          Row(
            children: [
              Icon(
                Icons.calendar_month_outlined,
                size: 16.sp,
                color: AppColors.textSecondary,
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  request.date,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.font12RegularGrey,
                ),
              ),
            ],
          ),

          SizedBox(height: 4.h),

          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 16.sp,
                color: AppColors.textSecondary,
              ),
              SizedBox(width: 4.w),
              Text(
                request.distance,
                style: AppTextStyle.font12RegularGrey,
              ),
            ],
          ),

          const Spacer(),

          CustomElevatedButton(
            onPressed: () {},
            height: 48.h,
            child: Text(
              'View Request',
              style: AppTextStyle.font18MediumOffWhite,
            ),
          ),
        ],
      ),
    );
  }
}