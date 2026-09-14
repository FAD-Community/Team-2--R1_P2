import 'package:fix_now_team_2/features/auth/presentation/screens/enter_email_screen_view.dart';
import 'package:fix_now_team_2/features/auth/presentation/screens/otp_verification_view.dart';
import 'package:fix_now_team_2/features/auth/presentation/screens/reset_password_view.dart';
import 'package:fix_now_team_2/features/auth/presentation/screens/sign_in_view.dart';

import 'package:fix_now_team_2/features/account_type/presentation/screens/account_type_screen.dart';
import 'package:fix_now_team_2/features/auth/provider_auth/presentation/screens/provider_sign_up_screen.dart';
import 'package:fix_now_team_2/Features/Job_statues/Presentation/Screens/Job_Statues_Screen.dart';
import 'package:fix_now_team_2/features/auth/provider_auth/presentation/screens/verification_status_screen.dart';

import 'package:fix_now_team_2/features/onboarding/presentation/screens/onboarding_screen_view.dart';
import 'package:fix_now_team_2/features/provider/presentation/screens/provider_bottom_nav_screen.dart';
import 'package:fix_now_team_2/features/splash/presentation/screens/splash_screen_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/provider_auth/presentation/screens/provider_sign_up_info_one_screen.dart';
import '../../features/auth/provider_auth/presentation/screens/provider_sign_up_info_two_screen.dart';
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
      case Routes.accountTypeScreen:
        return MaterialPageRoute(builder: (_) => const AccountTypeScreen());

      case Routes.providerSignUpScreen:
        return MaterialPageRoute(builder: (_) => const ProviderSignUpScreen());

      case Routes.providerSignUpInfoOneScreen:
        return MaterialPageRoute(builder: (_) => const ProviderSignUpInfoOneScreen());

      case Routes.providerSignUpInfoTwoScreen:
        return MaterialPageRoute(builder: (_) => const ProviderSignUpInfoTwoScreen());
      case Routes.verificationStatusScreen:
        return MaterialPageRoute(builder: (_) => const VerificationStatusScreen());
      case Routes.providerBottomNavBarScreen:
        return MaterialPageRoute(builder: (_) => const ProviderBottomNavScreen());

      case Routes.jobDetailsScreen:
        return MaterialPageRoute(builder: (_) => const JobStatuesScreen());
      case Routes.enterEmail:
        return MaterialPageRoute(builder: (_) => const EnterEmailScreenView());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
