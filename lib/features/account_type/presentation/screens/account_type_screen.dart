import 'package:fix_now_team_2/core/routing/routes.dart';
import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:fix_now_team_2/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountTypeScreen extends StatefulWidget {
  const AccountTypeScreen({super.key});

  @override
  State<AccountTypeScreen> createState() => _AccountTypeScreenState();
}

class _AccountTypeScreenState extends State<AccountTypeScreen> {
  bool isUserSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Center(
            child: SizedBox(
              height: 282.h,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 48.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Choose Your Role?",
                        style: AppTextStyle.font24SemiBoldWhite.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 31.h),
                      CustomElevatedButton(
                        backgroundColor: isUserSelected
                            ? AppColors.primary
                            : AppColors.white,
                        borderColor: AppColors.borderTextField,
                        onPressed: () {
                          setState(() {
                            isUserSelected = true;
                          });
                        },
                        child: Text(
                          "User",
                          style: isUserSelected
                              ? AppTextStyle.font16SemiBoldWhite
                              : AppTextStyle.font16SemiBoldPrimary,
                        ),
                      ),
                      SizedBox(height: 26.h),
                      CustomElevatedButton(
                        backgroundColor: !isUserSelected
                            ? AppColors.primary
                            : AppColors.white,
                        borderColor: AppColors.borderTextField,
                        onPressed: () {
                          setState(() {
                            isUserSelected = false;
                          });

                          Navigator.pushNamed(
                            context,
                            Routes.providerSignUpScreen,
                          );
                        },
                        child: Text(
                          'Technician',
                          style: !isUserSelected
                              ? AppTextStyle.font16SemiBoldWhite
                              : AppTextStyle.font16SemiBoldPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
