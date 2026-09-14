import 'package:fix_now_team_2/core/widgets/custom_search_field.dart';
import 'package:fix_now_team_2/features/provider/presentation/widgets/provider_home/provider_overview_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
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
          padding: EdgeInsets.symmetric(
              horizontal: 19.w,
            vertical: 24.h
          ),
          child: Column(
            children: [
              const ProviderHomeHeader(),
               SizedBox(
                height: 12.h,
              ),

              const CustomSearchField(
                hintText: 'Search for services',
              ),

              SizedBox(
                height: 24.h,
              ),

              ProviderAvailabilitySection(),

              SizedBox(
                height: 24.h,
              ),

              ProviderOverviewSection(),

            ],
          ),
        ),
      ),
    );
  }
}
