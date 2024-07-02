import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter extends InheritedWidget {
  final GoRouter router;

  const AppRouter({
    super.key,
    required this.router,
    required super.child,
  });

  static AppRouter of(BuildContext context) {
    final AppRouter? result = context.dependOnInheritedWidgetOfExactType<AppRouter>();
    assert(result != null, 'No AppRouter found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppRouter oldWidget) => router != oldWidget.router;

  void push(String route, [Object? extra]) {
    router.push(route, extra: extra);
  }

  void pop() {
    router.pop();
  }

  void home(){
     router.push('/');
  }
}
