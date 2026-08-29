import 'package:fix_now_team_2/core/cache/storage/shared_preferences_helper.dart';
import 'package:fix_now_team_2/core/di/service_locator.dart';
import 'package:fix_now_team_2/core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';



import 'fix_now.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  CacheHelper.init();
  runApp(
    BlocProvider(create: (context) => ThemeCubit(), child: const FixNow()),
  );
}
