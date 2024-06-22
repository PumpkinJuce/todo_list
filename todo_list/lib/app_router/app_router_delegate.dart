import 'package:flutter/material.dart';
import 'package:todo_list/app_router/page_builder.dart';

class AppRouterDelegate extends RouterDelegate<String> with ChangeNotifier {
  AppRouterDelegate() {
    setNewRoutePath('/main');
  }
  final _stackPages = <Page<dynamic>>[];

  Future<dynamic> pushNamed(String path, [Object? arguments]) async {
    final page = pageBuilder(path, arguments);
    if (page != null) {
      _stackPages.add(page);
      notifyListeners();
    }
  }

  void removePage(Page<dynamic> page) {
    _stackPages.remove(page);
    notifyListeners();
  }

  void pop() {
    if (_stackPages.isNotEmpty) {
      _stackPages.removeLast();
      notifyListeners();
    }
  }

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      pages: [
        ..._stackPages,
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        if (_stackPages.isEmpty) {
          return false;
        }
        _stackPages.removeLast();

        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<bool> popRoute() async {
    if (_stackPages.isNotEmpty) {
      _stackPages.removeLast();
      notifyListeners();
      return true;
    }
    return false;
  }

  @override
  Future<void> setNewRoutePath(String configuration) async {
    _stackPages.clear();
    final page = pageBuilder(configuration);
    if (page != null) {
      _stackPages.add(page);
      notifyListeners();
    }
  }
}
