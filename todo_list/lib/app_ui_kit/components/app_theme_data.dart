import 'package:flutter/material.dart';
import 'package:todo_list/app_ui_kit/components/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.backPrimary,
  appBarTheme: const AppBarTheme(
    color: AppColors.backPrimary,
  ),
);
