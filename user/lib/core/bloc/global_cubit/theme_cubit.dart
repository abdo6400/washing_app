
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/service_locator.dart';
import '../../../config/database/cache/cache_helper.dart';



abstract class ThemeState extends Equatable {
  final ThemeMode themeMode;
  const ThemeState(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}

class ChangeThemeState extends ThemeState {
  const ChangeThemeState(ThemeMode themeMode) : super(themeMode);
}

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ChangeThemeState(ThemeMode.light));

  ThemeMode currentThemeMode = ThemeMode.light;

  bool isDark() => currentThemeMode == ThemeMode.dark;

  Future<void> getThemeMode() async {
    final String? value = sl<CacheHelper>().getCachedThemeMode();

    if (value != null && value.compareTo("dark") == 0) {
      currentThemeMode = ThemeMode.dark;
      emit(const ChangeThemeState(ThemeMode.dark));
    } else {
      currentThemeMode = ThemeMode.light;
      emit(const ChangeThemeState(ThemeMode.light));
    }
  }

  Future<void> _changeTheme(ThemeMode mode) async {
    sl<CacheHelper>().cacheThemeMode(mode.name);
    currentThemeMode = mode;
    emit(ChangeThemeState(mode));
  }

  void toLightMode() => _changeTheme(ThemeMode.light);

  void toDarkMode() => _changeTheme(ThemeMode.dark);
}
