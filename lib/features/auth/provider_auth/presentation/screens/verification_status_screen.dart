import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:fix_now_team_2/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class VerificationStatusScreen extends StatelessWidget {
  const VerificationStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffold,
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 19.w),
            child: Column(
              children: [
               Image.asset(
                 "assets/images/provider/under_review_pic.png",
                  height: 352.h,
               ),
                SizedBox(
                  height: 24.h,
                ),
                CustomText(
                    text: "Provider Pending Approval",
                    style: AppTextStyle.font28SemiBoldBlack
                ),

              ],
            ),
          )
      ),
    );
  }
}
