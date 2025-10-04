import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moist_crumb/features/theme/cubits/cubit/theme_state.dart';

/// A cubit that manages the theme mode.
/// Currently only handling the light and dark theme modes.
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.light));

  void toggleTheme() {
    emit(state.copyWith(
      themeMode: state.themeMode == ThemeMode.light 
          ? ThemeMode.dark 
          : ThemeMode.light,
    ));
  }

  void setThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
