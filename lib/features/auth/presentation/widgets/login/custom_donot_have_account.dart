import 'package:fix_now_team_2/core/spacing/size_space.dart';
import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:fix_now_team_2/features/auth/presentation/widgets/login/custom_svg_row.dart';
import 'package:fix_now_team_2/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDonotHaveAccount extends StatelessWidget {
  const CustomDonotHaveAccount({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              s.dontHaveAccount,
              style: AppTextStyle.font12MediumBlack.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
            10.wSpace,
            InkWell(
              onTap: onTap,
              child: Text(
                s.signUp,
                style: AppTextStyle.font12MediumBlack.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary.withValues(alpha: .9),
                  decoration: TextDecoration.underline,
                  decorationThickness: 1,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
        50.hSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 70.w,
              child: Divider(color: AppColors.textSecondary),
            ),
            12.wSpace,
            Text(
              s.orSignInWith,
              style: AppTextStyle.font16MediumLabelGrey.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
              ),
            ),
            12.wSpace,
            SizedBox(
              width: 70.w,
              child: Divider(color: AppColors.textSecondary),
            ),
          ],
        ),
        15.hSpace,
        CustomSvgRow(),
      ],
    );
  }
}
