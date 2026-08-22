import 'package:fix_now_team_2/core/routing/app_router.dart';
import 'package:fix_now_team_2/core/routing/routes.dart';
import 'package:fix_now_team_2/l10n/app_localizations.dart';
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
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
