import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/features/auth/presentation/widgets/login/custom_checkbox.dart';
import 'package:fix_now_team_2/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRememberMe extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final VoidCallback onForgotPasswordTap;

  const CustomRememberMe({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onForgotPasswordTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomCheckbox(value: value, onChanged: onChanged),
              SizedBox(width: 6.w),
              Text(
                s.rememberMe,
                style: TextStyle(color: AppColors.primary, fontSize: 14.sp),
              ),
            ],
          ),
          InkWell(
            onTap: onForgotPasswordTap,
            child: Text(
              s.forgotPassword,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
