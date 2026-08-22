import 'package:fix_now_team_2/Features/Job_statues/presentation/Screen/Job_Statues_Screen.dart';
import 'package:fix_now_team_2/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FixNow extends StatelessWidget {
  const FixNow({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Inter"),
        home: Scaffold(
          backgroundColor: AppColors.background,
          body: JobStatuesScreen(),
        ),
      ),
    );
  }
}
