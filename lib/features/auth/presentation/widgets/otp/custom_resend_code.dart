import 'package:fix_now_team_2/core/spacing/size_space.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:fix_now_team_2/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomResendCode extends StatelessWidget {
  const CustomResendCode({
    super.key,
    required this.onTap,
    required this.seconds,
  });

  final VoidCallback? onTap;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          s.didntReceiveCode,
          style: AppTextStyle.font12RegularBlack.copyWith(
            fontSize: 14.sp,
          ),
        ),
        5.wSpace,
        InkWell(
          onTap: onTap,
          child: Text(
            seconds > 0
                ? 'Resend code in 00:${seconds.toString().padLeft(2, '0')}'
                : s.resendCode,
            style: AppTextStyle.font16SemiBoldPrimary.copyWith(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}