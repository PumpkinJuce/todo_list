import 'package:flutter/material.dart';
import 'package:todo_list/app_ui_kit/components/app_colors.dart';

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  const MyHeaderDelegate({
    required this.icon,
    required this.doneTasksCount,
    required this.onIconTap,
  });

  final IconData icon;
  final int doneTasksCount;
  final void Function() onIconTap;

  EdgeInsets get _padding =>
      const EdgeInsets.only(left: 40, right: 12, bottom: 12);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final progress = shrinkOffset / maxExtent;

    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: _padding,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedOpacity(
            duration: Duration.zero,
            opacity: progress,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Мои дела',
                  style: textTheme.displayMedium,
                ),
                InkWell(
                  onTap: onIconTap,
                  child: Icon(icon, color: AppColors.purple),
                ),
              ],
            ),
          ),
          AnimatedOpacity(
            duration: Duration.zero,
            opacity: 1 - progress,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Мои дела',
                  style: textTheme.displayLarge,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Выполнено - $doneTasksCount',
                      style: textTheme.bodyLarge
                          ?.copyWith(color: AppColors.labelTertiary),
                    ),
                    InkWell(
                      onTap: onIconTap,
                      child: Icon(icon, color: AppColors.purple),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 110;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
