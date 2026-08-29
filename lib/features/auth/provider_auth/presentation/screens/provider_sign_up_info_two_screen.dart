import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:fix_now_team_2/core/widgets/custom_dropdown_field.dart';
import 'package:fix_now_team_2/core/widgets/custom_provider_sign_up_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_photo_upload_field.dart';

class ProviderSignUpInfoTwoScreen extends StatefulWidget {
  const ProviderSignUpInfoTwoScreen({
    super.key,
  });

  @override
  State<ProviderSignUpInfoTwoScreen> createState() =>
      _ProviderSignUpInfoTwoScreenState();
}

class _ProviderSignUpInfoTwoScreenState
    extends State<ProviderSignUpInfoTwoScreen> {
  String? selectedServiceCategory;
  String? selectedExperience;
  String? selectedAvailability;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
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
              padding: EdgeInsets.symmetric(
                horizontal: 19.w,
                vertical: 24.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomProviderSignUpProgressIndicator(
                    currentStep: 3,
                  ),

                  SizedBox(height: 20.h),
                  // changed color after approved previous PR (waiting)
                  Text(
                    'Professional Details',
                    style: AppTextStyle.font24MediumPrimary.copyWith(color: Color(0xff0A0A29)),
                  ),

                  SizedBox(height: 24.h),

                  CustomDropdownField(
                    hintText: 'Service Category',
                    value: selectedServiceCategory,
                    items: const [
                      'Plumbing',
                      'Electrical',
                      'Carpentry',
                      'Painting',
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedServiceCategory = value;
                      });
                    },
                  ),

                  SizedBox(height: 16.h),

                  CustomDropdownField(
                    hintText: 'Years of Experience',
                    value: selectedExperience,
                    items: const [
                      'Less than 1 year',
                      '1 - 3 years',
                      '3 - 5 years',
                      'More than 5 years',
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedExperience = value;
                      });
                    },
                  ),

                  SizedBox(height: 16.h),

                  CustomPhotoUploadField(
                    text: 'Upload Certifications Photo (Optional)',
                    onTap: () {},
                  ),

                  SizedBox(height: 12.h),

                  CustomDropdownField(
                    hintText: 'Availability Time',
                    value: selectedAvailability,
                    items: const [
                      'Morning',
                      'Afternoon',
                      'Evening',
                      'Any Time',
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedAvailability = value;
                      });
                    },
                  ),

                  SizedBox(height: 28.h),

                  Text(
                    'Payment Setup',
                    style: AppTextStyle.font24MediumBlack,
                  ),

                  SizedBox(height: 12.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}