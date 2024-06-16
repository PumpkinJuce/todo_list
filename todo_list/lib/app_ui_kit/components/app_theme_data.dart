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
);
