import 'package:flutter/material.dart';
import 'package:todo_list/app_ui_kit/components/app_colors.dart';

class AppThemeData {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backPrimary,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.white,
    ),
    datePickerTheme: DatePickerThemeData(
      dayStyle: const TextStyle(color: AppColors.purple),
      dayOverlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        return AppColors.purple;
      }),
      headerHeadlineStyle: const TextStyle(
        color: AppColors.purple,
      ),
      todayBorder: const BorderSide(color: AppColors.purple),
      todayBackgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        return AppColors.purple.withOpacity(0.3);
      }),
      rangeSelectionBackgroundColor: AppColors.purple.withOpacity(0.3),
      weekdayStyle: const TextStyle(color: AppColors.purple),
      headerBackgroundColor: AppColors.purple.withOpacity(0.1),
      headerForegroundColor: AppColors.purple,
      yearStyle: const TextStyle(color: AppColors.purple),
    ),
    switchTheme: SwitchThemeData(
      trackColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.purple;
        }
        return AppColors.lightOverlay;
      }),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.green;
        }
        return AppColors.white;
      }),
      side: const BorderSide(color: AppColors.lightSeparator),
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.backPrimary,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
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
}
