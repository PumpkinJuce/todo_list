import 'package:flutter/material.dart';
import 'package:todo_list/core/app_ui_kit/components/app_colors.dart';

Future<DateTime?> showAppDatePicker(BuildContext context) async {
  final now = DateTime.now();
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(
      now.year,
      now.month,
      now.day,
    ),
    lastDate: DateTime(2100),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.purple,
          ),
        ),
        child: child!,
      );
    },
  );
}
