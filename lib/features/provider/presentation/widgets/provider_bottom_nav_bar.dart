import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:fix_now_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProviderBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  const ProviderBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  static const List<String> _iconPaths = [
    'assets/icons/provider_home_icon.svg',
    'assets/icons/provider_request_icon.svg',
    'assets/icons/provider_chat_icon.svg',
    'assets/icons/provider_profile_icon.svg',
  ];

  static const List<String> _labels = [
    'Home',
    'Requests',
    'Chat',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 12.h,
      ),
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.borderTextField,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          _iconPaths.length,
              (index) => _buildNavItem(index),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 6.h,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.backgroundBottomNavIcon
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              _iconPaths[index],
              width: 20.w,
              height: 20.h,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? AppColors.selectedTextBottomNav
                    : AppColors.unSelectedTextBottomNav,
                BlendMode.srcIn,
              ),
            ),

            if (isSelected) ...[
              SizedBox(width: 5.w),
              Text(
                _labels[index],
                style: AppTextStyle.font14MediumTextField
              ),
            ],
          ],
        ),
      ),
    );
  }
}