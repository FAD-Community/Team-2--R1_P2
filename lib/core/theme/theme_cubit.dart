import 'package:fix_now_team_2/core/cache/storage/shared_preferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const String themeKey = 'theme_mode';

  ThemeCubit() : super(_getInitialTheme());

  static ThemeMode _getInitialTheme() {
    final String? savedTheme = CacheHelper.getData(themeKey) as String?;

    if (savedTheme == 'dark') {
      return ThemeMode.dark;
    }

    if (savedTheme == 'light') {
      return ThemeMode.light;
    }

    return ThemeMode.system;
  }

  Future<void> toggleTheme() async {
    final newTheme = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(newTheme);
    await CacheHelper.saveData(
      key: themeKey,
      value: newTheme == ThemeMode.dark ? 'dark' : 'light',
    );
  }

  Future<void> setTheme(ThemeMode mode) async {
    emit(mode);
    await CacheHelper.saveData(key: themeKey, value: mode.name);
  }
}
