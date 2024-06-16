import 'package:flutter/material.dart';
import 'package:todo_list/app_ui_kit/app_ui_kit.dart';
import 'package:todo_list/presentation/main_page/widgets/priority_indicator.dart';
import 'package:todo_list/presentation/main_page/widgets/slidable/slidable_item_wrapper.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    required this.title,
    required this.index,
    this.subtitle,
    super.key,
  });

  final String title;
  final String? subtitle;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SlidableItemWrapper(
      index: index,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.backSecondary,
        ),
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 5,
        ),
        
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              checkColor: Colors.white,
              value: true,
              onChanged: (bool? value) {},
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Body(
                        title,
                        maxLines: 3,
                      ),
                      if (subtitle != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Subhead(
                            subtitle ?? '',
                            maxLines: 1,
                            color: AppColors.labelTertiary,
                          ),
                        )
                    ],
                  )),
            ),
            // const Icon(
            //   Icons.info_outline,
            //   color: AppColors.labelTertiary,
            // ),
            const Padding(
              padding: EdgeInsets.only(top: 15, right: 10),
              child: PriorityIndicator(PriorityLevel.height),
            )
          ],
        ),
      ),
    );
  }
}
