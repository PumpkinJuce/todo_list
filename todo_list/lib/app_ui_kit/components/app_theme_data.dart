import 'package:flutter/material.dart';
import 'package:todo_list/app_ui_kit/components/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.backPrimary,
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.green;
      }
      return Colors.white;
    }),
    side: const BorderSide(color: AppColors.lightSeparator),
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.backPrimary,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
      overflow: TextOverflow.ellipsis,
    ),
    displayMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
      overflow: TextOverflow.ellipsis,
    ),
    displaySmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
      overflow: TextOverflow.ellipsis,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      overflow: TextOverflow.ellipsis,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      overflow: TextOverflow.ellipsis,
    ),
  ),
);
