// import 'package:fix_now_team_2/core/routing/routes.dart';
import 'package:fix_now_team_2/core/routing/routes.dart';
import 'package:fix_now_team_2/features/splash/presentation/widgets/custom_splash_photo.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, Routes.onboardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomSplashPhoto(),
    );
  }
}
