import 'package:flutter/material.dart';
import 'package:todo_list/app_router/app_router_delegate.dart';

class AppRouter extends InheritedNotifier<AppRouterDelegate> {
  const AppRouter({
    super.key,
    required AppRouterDelegate super.notifier,
    required super.child,
  });

  static AppRouterDelegate of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppRouter>()!.notifier!;
  }
}
