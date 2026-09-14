import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}
