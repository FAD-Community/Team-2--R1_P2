import 'package:fix_now_team_2/core/cache/storage/shared_preferences_helper.dart';
import 'package:fix_now_team_2/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'fix_now.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  CacheHelper.init();
  
  runApp(const FixNow());
}
