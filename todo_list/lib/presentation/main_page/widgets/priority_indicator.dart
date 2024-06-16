import 'package:flutter/material.dart';
import 'package:todo_list/app_ui_kit/components/app_colors.dart';

enum PriorityLevel {
  low(0, AppColors.gray),
  medium(2, AppColors.blue),
  height(3, AppColors.red);

  const PriorityLevel(this.iconCount, this.color);
  final int iconCount;
  final Color color;
}

class PriorityIndicator extends StatelessWidget {
  const PriorityIndicator(this.level, {super.key});
  final PriorityLevel level;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(level.iconCount, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: _LevelIcon(
            color: level.color,
          ),
        );
      }),
    );
  }
}

class _LevelIcon extends StatelessWidget {
  const _LevelIcon({this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color == null ? AppColors.gray : color!,
        ),
        color: color ?? AppColors.white,
      ),
    );
  }
}
