import 'package:fix_now_team_2/core/widgets/custom_text_form_field.dart';
import 'package:fix_now_team_2/features/auth/provider_auth/presentation/widgets/provider_sign_up_widgets/provider_sign_up_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../widgets/provider_sign_up_widgets/provider_sign_up_header.dart';
import '../widgets/provider_sign_up_widgets/provider_terms_checkbox.dart';

class ProviderSignUpScreen extends StatefulWidget {
  const ProviderSignUpScreen({super.key});

  @override
  State<ProviderSignUpScreen> createState() => _ProviderSignUpScreenState();
}

class _ProviderSignUpScreenState extends State<ProviderSignUpScreen> {
  final TextEditingController dateOfBirthController = TextEditingController();

  bool agreeToTerms = false;

  @override
  void dispose() {
    dateOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffold,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/provider/provider_sign_up_background.png',
                fit: BoxFit.cover,
              ),
            ),

            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
              child: Column(
                children: [
                  const ProviderSignUpProgressIndicator(),

                  SizedBox(height: 28.h),

                  const ProviderSignUpHeader(),

                  SizedBox(height: 48.h),

                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 52.h,
                          child: CustomTextFormField(
                            hintText: 'First Name',
                            fillColor: AppColors.white,
                            borderColor: AppColors.borderTextField,
                            focusedBorderColor: AppColors.primary,
                          ),
                        ),
                      ),

                      SizedBox(width: 12.w),

                      Expanded(
                        child: SizedBox(
                          height: 52.h,
                          child: CustomTextFormField(
                            hintText: 'Second Name',
                            fillColor: AppColors.white,
                            borderColor: AppColors.borderTextField,
                            focusedBorderColor: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  SizedBox(
                    height: 52.h,
                    child: CustomTextFormField(
                      hintText: 'Email',
                      fillColor: AppColors.white,
                      borderColor: AppColors.borderTextField,
                      focusedBorderColor: AppColors.primary,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  SizedBox(
                    height: 52.h,
                    child: CustomTextFormField(
                      hintText: 'Password',
                      fillColor: AppColors.white,
                      borderColor: AppColors.borderTextField,
                      focusedBorderColor: AppColors.primary,
                      obscureText: true,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  SizedBox(
                    height: 52.h,
                    child: CustomTextFormField(
                      hintText: 'Confirm Password',
                      fillColor: AppColors.white,
                      borderColor: AppColors.borderTextField,
                      focusedBorderColor: AppColors.primary,
                      obscureText: true,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  SizedBox(
                    height: 52.h,
                    child: CustomTextFormField(
                      hintText: 'Phone Number',
                      fillColor: AppColors.white,
                      borderColor: AppColors.borderTextField,
                      focusedBorderColor: AppColors.primary,
                      keyboardType: TextInputType.phone,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  SizedBox(
                    height: 52.h,
                    child: CustomTextFormField(
                      controller: dateOfBirthController,
                      hintText: 'Date of birth',
                      fillColor: AppColors.white,
                      borderColor: AppColors.borderTextField,
                      focusedBorderColor: AppColors.primary,
                      suffixIcon: Icon(
                        Icons.calendar_month_outlined,
                        size: 20.sp,
                        color: const Color(0xFF30303A),
                      ),
                    ),
                  ),

                  SizedBox(height: 16.h),

                  ProviderTermsCheckbox(
                    value: agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        agreeToTerms = value ?? false;
                      });
                    },
                  ),

                  SizedBox(height: 48.h),

                  SizedBox(
                    width: 176.w,
                    child: CustomElevatedButton(
                      child: Text("Next"),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
