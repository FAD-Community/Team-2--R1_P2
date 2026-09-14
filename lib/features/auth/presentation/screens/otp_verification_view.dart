import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/features/auth/presentation/widgets/otp/custom_otp_body.dart';
import 'package:flutter/material.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffold,
      body: CustomOtpBody(),
    );
  }
}
