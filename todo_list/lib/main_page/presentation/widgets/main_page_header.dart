import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list/app_ui_kit/components/app_colors.dart';

class MainPageHeader extends SliverPersistentHeaderDelegate {
  const MainPageHeader({
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
    final progress = shrinkOffset / maxExtent;

    return Container(
      color: theme.scaffoldBackgroundColor,
      alignment: Alignment.bottomCenter,
      padding: _padding,
      constraints: BoxConstraints(minHeight: minExtent),
      child: AnimatedSwitcher(
        duration: Duration.zero,
        child: progress < 0.4
            ? _NarrowVariantHeader(
                icon: icon,
                doneTasksCount: doneTasksCount,
                onIconTap: onIconTap)
            : _WideVarianHeader(icon: icon, onIconTap: onIconTap),
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 90;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _WideVarianHeader extends StatelessWidget {
  const _WideVarianHeader(
      {required this.icon, required this.onIconTap, super.key});

  final IconData icon;
  final void Function() onIconTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          AppLocalizations.of(context)!.myTasks,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        InkWell(
          onTap: onIconTap,
          child: Icon(icon, color: AppColors.purple),
        ),
      ],
    );
  }
}

class _NarrowVariantHeader extends StatelessWidget {
  const _NarrowVariantHeader({
    required this.icon,
    required this.doneTasksCount,
    required this.onIconTap,
  });

  final IconData icon;
  final int doneTasksCount;
  final void Function() onIconTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final localization = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.myTasks,
          style: textTheme.displayLarge,
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${localization.done} - $doneTasksCount',
              style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
            ),
            InkWell(
              onTap: onIconTap,
              child: Icon(icon, color: AppColors.purple),
            ),
          ],
        ),
      ],
    );
  }
}
