import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:fix_now_team_2/core/widgets/custom_elevated_button.dart';
import 'package:fix_now_team_2/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class VerificationStatusScreen extends StatelessWidget {
  const VerificationStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffold,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 19.w),
              child: Column(
                children: [
                 Container(
                   height: 352.h,
                   decoration: BoxDecoration(
                     color: AppColors.backgroundScaffold
                   ),
                   child: Image.asset(
                     "assets/images/provider/waiting_approve.png",
                   ),
                 ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomText(
                      text: "Provider Pending Approval",
                      style: AppTextStyle.font28SemiBoldBlack
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  CustomText(
                    textAlign: TextAlign.center,
                      text: "We’ll notify you once you’re approved\nand ready to start working",
                      style: AppTextStyle.font18RegularColor55555
                  ),
            
                  SizedBox(
                    height: 36.h,
                  ),
            
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/icons_check.svg",width: 21.w,height: 21.h,),
                     SizedBox(
                       width: 16.w,
                     ),
                     Expanded(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           CustomText(
                               text: "Application Submitted",
                               style: AppTextStyle.font20MediumLabelGrey
                           ),
                           SizedBox(
                             height: 4.h,
                           ),
                           CustomText(
                               text: "Your application has been received",
                               style: AppTextStyle.font18RegularColor55555
                           ),

                           SizedBox(
                             height: 20.h,
                           ),
                         ],
                       ),
                     )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/pending_icon.svg",width: 21.w,height: 21.h,),
                     SizedBox(
                       width: 16.w,
                     ),
                     Expanded(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           CustomText(
                               text: "Approval Pending",
                               style: AppTextStyle.font20MediumLabelGrey
                           ),
                           SizedBox(
                             height: 4.h,
                           ),
                           CustomText(
                               text: "Waiting for final approval",
                               style: AppTextStyle.font18RegularColor55555
                           ),

                         ],
                       ),
                     )
                    ],
                  ),
                  
                  SizedBox(
                    height: 24.h,
                  ),

                  CustomElevatedButton(
                    height: 48.h,
                    width: 200.w,
                    backgroundColor:AppColors.backgroundScaffold,
                      borderColor: AppColors.primary,
                      onPressed: (){},
                      child: Row(
                        children: [
                          Text(
                            "Connect Support",style: AppTextStyle.font16SemiBoldPrimary,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: SvgPicture.asset("assets/icons/arrow-right.svg",
                            ),
                          )
                        ],
                      )
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
