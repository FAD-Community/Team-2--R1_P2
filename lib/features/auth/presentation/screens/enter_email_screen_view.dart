import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/features/auth/presentation/widgets/custom_enter_email_body.dart';
import 'package:flutter/material.dart';

class EnterEmailScreenView extends StatelessWidget {
  const EnterEmailScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomEnterEmailBody(),
    );
  }
}
