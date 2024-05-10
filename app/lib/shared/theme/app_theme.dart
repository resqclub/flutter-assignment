import 'package:app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.cyan,
    error: AppColors.error,
    background: AppColors.white,
  ),
  // scaffoldBackgroundColor: AppColors.white,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.white,
  ),
  useMaterial3: true,
);
