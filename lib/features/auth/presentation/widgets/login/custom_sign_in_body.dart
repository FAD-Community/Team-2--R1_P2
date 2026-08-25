import 'package:fix_now_team_2/constants/assets.dart';
import 'package:fix_now_team_2/core/routing/routes.dart';
import 'package:fix_now_team_2/core/spacing/size_space.dart';
import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:fix_now_team_2/core/widgets/custom_elevated_button.dart';
import 'package:fix_now_team_2/core/widgets/custom_text_form_field.dart';
import 'package:fix_now_team_2/core/widgets/header_clipper.dart';
import 'package:fix_now_team_2/features/auth/presentation/widgets/login/custom_donot_have_account.dart';
import 'package:fix_now_team_2/features/auth/presentation/widgets/login/custom_remember.dart';
import 'package:fix_now_team_2/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignInBody extends StatefulWidget {
  const CustomSignInBody({super.key});

  @override
  State<CustomSignInBody> createState() => _CustomSignInBodyState();
}

bool isChecked = false;
bool isPasswordHidden = true;
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
GlobalKey<FormState> key = GlobalKey();

class _CustomSignInBodyState extends State<CustomSignInBody> {
  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: key,
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
                      s.welcomeBack,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.font20MediumBlack.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: CustomTextFormField(
                  controller: email,
                  hintText: s.email,
                  fillColor: AppColors.surface,
                  textColor: AppColors.textSecondary,
                  borderColor: AppColors.border,
                  focusedBorderColor: AppColors.primary,
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: CustomTextFormField(
                  obscureText: isPasswordHidden,
                  controller: password,
                  hintText: s.password,
                  fillColor: AppColors.surface,
                  textColor: AppColors.textSecondary,
                  borderColor: AppColors.border,
                  focusedBorderColor: AppColors.primary,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    },
                    icon: Opacity(
                      opacity: .5,
                      child: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              CustomRememberMe(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
                onForgotPasswordTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.otpVerification,
                  );
                },
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                child: CustomElevatedButton(
                  onPressed: () {},
                  child: Text(s.login),
                ),
              ),
              5.hSpace,
              CustomDonotHaveAccount(onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
