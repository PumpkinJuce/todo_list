import 'package:flutter/material.dart';
import 'package:todo_list/app_ui_kit/components/app_colors.dart';

class SlidableActionIconWidget extends StatelessWidget {
  const SlidableActionIconWidget({
    required this.icon,
    required this.backgroundColor,
    super.key,
  });
  final IconData icon;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: Icon(
        icon,
        color: AppColors.white,
        size: 16,
      ),
    );
  }
}
