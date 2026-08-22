import 'package:fix_now_team_2/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSplashPhoto extends StatelessWidget {
  const CustomSplashPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        clipBehavior: Clip.none,
        width: 230.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(Assets.imagesSplash),
          ),
        ),
      ),
    );
  }
}
