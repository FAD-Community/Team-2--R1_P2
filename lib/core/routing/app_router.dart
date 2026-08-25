import 'package:fix_now_team_2/features/auth/presentation/screens/otp_verification_view.dart';
import 'package:fix_now_team_2/features/auth/presentation/screens/reset_password_view.dart';
import 'package:fix_now_team_2/features/auth/presentation/screens/sign_in_view.dart';
import 'package:fix_now_team_2/features/onboarding/presentation/screens/onboarding_screen_view.dart';
import 'package:fix_now_team_2/features/splash/presentation/screens/splash_screen_view.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreenView());
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreenView());
      case Routes.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInView());
      case Routes.otpVerification:
        return MaterialPageRoute(builder: (_) => const OtpVerificationView());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
