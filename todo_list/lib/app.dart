import 'package:flutter/material.dart';
import 'package:todo_list/app_ui_kit/components/app_theme_data.dart';
import 'package:todo_list/main_page/presentation/main_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: ThemeData(),
      home: const MainPage(),
    );
  }
}
