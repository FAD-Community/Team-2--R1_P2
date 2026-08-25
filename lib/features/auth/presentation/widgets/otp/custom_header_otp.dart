import 'package:fix_now_team_2/core/spacing/size_space.dart';
import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:fix_now_team_2/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CustomHeaderOtp extends StatelessWidget {
  const CustomHeaderOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Text(
            s.otpVerification,
            style: AppTextStyle.font24SemiBoldPrimary.copyWith(
              color: AppColors.black,
            ),
          ),
          10.hSpace,
          Text(s.otpVerificationDescription, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
