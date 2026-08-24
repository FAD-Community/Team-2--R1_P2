import 'package:fix_now_team_2/Features/Job_statues/Presentation/Screens/Job_Statues_Screen.dart';
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

      case Routes.jobDetailsScreen:
        return MaterialPageRoute(builder: (_) => const JobStatuesScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
