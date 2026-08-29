import 'package:fix_now_team_2/constants/assets.dart';
import 'package:fix_now_team_2/core/errors/validator/validator.dart';
import 'package:fix_now_team_2/core/spacing/size_space.dart';
import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:fix_now_team_2/core/widgets/custom_elevated_button.dart';
import 'package:fix_now_team_2/core/widgets/custom_text_form_field.dart';
import 'package:fix_now_team_2/core/widgets/header_clipper.dart';
import 'package:fix_now_team_2/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEnterEmailBody extends StatelessWidget {
  CustomEnterEmailBody({super.key});
  final TextEditingController enterEmail = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: HeaderClipper(),
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      Assets.imagesBackground,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 60.h,
                  child: Text(
                    s.enterEmail,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.font20MediumBlack.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                    ),
                  ),
                ),
              ],
            ),
            20.hSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: CustomTextFormField(
                validator: (value) => Validator.validateEmail(
                  value,
                  s.emailRequired,
                  s.invalidEmail,
                ),
                label: s.email,
                controller: enterEmail,
                hintText: s.enterEmailPlease,
                fillColor: AppColors.white,
                borderColor: AppColors.border,
                focusedBorderColor: AppColors.primary,
              ),
            ),
            20.hSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: CustomElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                child: Text(s.sendButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
