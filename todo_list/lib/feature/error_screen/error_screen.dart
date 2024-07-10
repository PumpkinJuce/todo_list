import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list/core/app_router/app_router_inh.dart';
import 'package:todo_list/core/app_ui_kit/components/app_colors.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({this.title, super.key});
  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title ?? localization.errorRoute,
              style: theme.displayMedium,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => AppRouter.of(context).home(),
              child: Text(
                localization.goBackHome,
                textAlign: TextAlign.center,
                style: theme.titleSmall?.copyWith(color: AppColors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
