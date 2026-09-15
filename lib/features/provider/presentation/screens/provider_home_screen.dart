import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:fix_now_team_2/core/widgets/custom_search_field.dart';
import 'package:fix_now_team_2/core/widgets/custom_text.dart';
import 'package:fix_now_team_2/features/provider/presentation/widgets/provider_home/provider_overview_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/provider_new_requests_dummy_data.dart';
import '../widgets/provider_home/provider_availability_section.dart';
import '../widgets/provider_home/provider_home_header.dart';

class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffold,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 24.h),
          child: Column(
            children: [
              const ProviderHomeHeader(),
              SizedBox(height: 12.h),

              const CustomSearchField(hintText: 'Search for services'),

              SizedBox(height: 24.h),

              ProviderAvailabilitySection(),

              SizedBox(height: 24.h),

              ProviderOverviewSection(),

              SizedBox(height: 24.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "New Requests",
                    style: AppTextStyle.font24MediumBlack,
                  ),
                  CustomText(
                    text: "View All",
                    style: AppTextStyle.font16SemiBoldWhite.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),
              const ProviderNewRequestsDummy(),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Upcoming Jobs",
                    style: AppTextStyle.font24MediumBlack,
                  ),
                  CustomText(
                    text: "View All",
                    style: AppTextStyle.font16SemiBoldWhite.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
