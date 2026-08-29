import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:fix_now_team_2/core/widgets/custom_elevated_button.dart';
import 'package:fix_now_team_2/core/widgets/custom_text_form_field.dart';
import 'package:fix_now_team_2/features/auth/provider_auth/presentation/widgets/provider_sign_up_info_one_widgets/provider_sign_up_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/provider_sign_up_info_one_widgets/provider_location_dropdown.dart';
import '../widgets/provider_sign_up_info_one_widgets/provider_photo_upload_field.dart';
import '../widgets/provider_sign_up_info_one_widgets/provider_service_area.dart';

class ProviderSignUpInfoOneScreen extends StatefulWidget {
  const ProviderSignUpInfoOneScreen({super.key});

  @override
  State<ProviderSignUpInfoOneScreen> createState() =>
      _ProviderSignUpInfoOneScreenState();
}

class _ProviderSignUpInfoOneScreenState
    extends State<ProviderSignUpInfoOneScreen> {
  String? selectedGovernment;
  String? selectedCity;
  String? selectedServiceArea;

  final TextEditingController streetAddressController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  @override
  void dispose() {
    streetAddressController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProviderSignUpProgressIndicator(),
              SizedBox(height: 28.h),
              Text(
                'Upload Required Photos',
                style: AppTextStyle.font24MediumBlack,
              ),

              SizedBox(height: 12.h),

              ProviderPhotoUploadField(
                text: 'Upload a clear photo of yourself',
                onTap: () {},
              ),

              SizedBox(height: 10.h),

              ProviderPhotoUploadField(
                text: 'Upload a clear photo of your ID card',
                onTap: () {},
              ),

              SizedBox(height: 24.h),

              Text('Location', style: AppTextStyle.font20SemiBoldBlack),

              SizedBox(height: 12.h),

              ProviderLocationDropdown(
                hintText: 'Government',
                value: selectedGovernment,
                items: const ['Cairo', 'Giza', 'Alexandria', 'Dakahlia'],
                onChanged: (value) {
                  setState(() {
                    selectedGovernment = value;
                  });
                },
              ),

              SizedBox(height: 12.h),

              ProviderLocationDropdown(
                hintText: 'City',
                value: selectedCity,
                items: const [
                  'Mansoura',
                  'Nasr City',
                  '6th of October',
                  'Maadi',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedCity = value;
                  });
                },
              ),

              SizedBox(height: 12.h),

              SizedBox(
                height: 48.h,
                child: CustomTextFormField(
                  controller: streetAddressController,
                  hintText: 'Street Address',
                  fillColor: AppColors.white,
                  borderColor: AppColors.primaryLight,
                  focusedBorderColor: AppColors.primary,
                ),
              ),

              SizedBox(height: 12.h),

              SizedBox(
                height: 48.h,
                child: CustomTextFormField(
                  controller: locationController,
                  hintText: 'Location',
                  fillColor: AppColors.white,
                  borderColor: AppColors.primaryLight,
                  focusedBorderColor: AppColors.primary,
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(14.w),
                    child: SvgPicture.asset(
                      'assets/icons/location_icon.svg',
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12.h),
              ProviderServiceArea(
                value: selectedServiceArea,
                items: const [
                  'Within 5 km',
                  'Within 10 km',
                  'Within 20 km',
                  'Within 30 km',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedServiceArea = value;
                  });
                },
              ),
              SizedBox(height: 22.h),

              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    backgroundColor: AppColors.primary,
                    borderColor: AppColors.primary,
                    onPressed: () {},
                    child: Text(
                      'Next',
                      style: AppTextStyle.font16SemiBoldWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
