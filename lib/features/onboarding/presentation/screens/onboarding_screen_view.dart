import 'package:fix_now_team_2/constants/assets.dart';
import 'package:fix_now_team_2/core/routing/routes.dart';
import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/widgets/custom_elevated_button.dart';
import 'package:fix_now_team_2/features/onboarding/data/model/onboarding_model.dart';
import 'package:fix_now_team_2/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/onboarding_item.dart';

class OnboardingScreenView extends StatefulWidget {
  const OnboardingScreenView({super.key});

  @override
  State<OnboardingScreenView> createState() => _OnboardingScreenViewState();
}

class _OnboardingScreenViewState extends State<OnboardingScreenView> {
  late final PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;
    final List<OnboardingModel> onboardingData = [
      OnboardingModel(
        image: Assets.imagesOnboardingOne,
        title: s.easyBooking,
        description: s.easyBookingDescription,
        icon: Icons.touch_app_outlined,
        iconBackgroundColor: AppColors.primary,
        iconColor: AppColors.white,
      ),
      OnboardingModel(
        image: Assets.imagesOnboardingTwo,
        title: s.securePayment,
        description: s.securePaymentDescription,
        icon: Icons.verified_user_outlined,
        iconBackgroundColor: AppColors.primary,
        iconColor: AppColors.white,
      ),
      OnboardingModel(
        image: Assets.imagesOnboardingThree,
        title: s.fastResponse,
        description: s.fastResponseDescription,
        icon: Icons.bolt_outlined,
        iconBackgroundColor: AppColors.primary,
        iconColor: AppColors.white,
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffold,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Pages
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 60.h),
                  child: PageView.builder(
                    clipBehavior: Clip.none,
                    controller: _pageController,
                    itemCount: onboardingData.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return OnboardingItem(
                        onboardingModel: onboardingData[index],
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(onboardingData.length, (index) {
                  final bool isActive = index == _currentPage;
                  return AnimatedContainer(
                    clipBehavior: Clip.none,
                    duration: const Duration(milliseconds: 250),
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    width: isActive ? 30.w : 7.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColors.primary
                          : AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  );
                }),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.only(right: 40.w, left: 40.w, bottom: 20.w),
                child: SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: CustomElevatedButton(
                    onPressed: () {
                      if (_currentPage < onboardingData.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.signInScreen,
                        );
                      }
                    },
                    child: Text(
                      _currentPage == onboardingData.length - 1
                          ? s.getStarted
                          : s.nextButton,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
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
