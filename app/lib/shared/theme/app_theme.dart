import 'package:app/shared/theme/app_colors.dart';
import 'package:app/shared/theme/app_text_styles.dart';
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
    backgroundColor: AppColors.primary,
    titleTextStyle: AppTextStyles.h3,
    iconTheme: IconThemeData(color: AppColors.lightGrey),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: AppColors.lightGrey,
    unselectedLabelColor: AppColors.lightGrey,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.lightGrey,
  ),
  textTheme: const TextTheme(
    displayLarge: AppTextStyles.h1,
    displayMedium: AppTextStyles.h2,
    displaySmall: AppTextStyles.h3,
    headlineMedium: AppTextStyles.h4,
    bodyLarge: AppTextStyles.bodyLg,
    bodyMedium: AppTextStyles.body,
    titleMedium: AppTextStyles.bodySm,
    titleSmall: AppTextStyles.bodyXs,
  ),
  useMaterial3: true,
);
