import 'package:fix_now_team_2/core/theme/app_colors.dart';
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
               Image.asset("assets/images/provider/under_review_pic.png",
               height: 352.h,
               )
              ],
            ),
          )
      ),
    );
  }
}
