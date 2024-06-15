import 'package:flutter/material.dart';
import 'package:todo_list/app_ui_kit/app_ui_kit.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              title: LargeTitle('Мои дела'),
            ),
          ),
          SliverList.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.red,
                  height: 40,
                  width: 800,
                  margin: const EdgeInsets.only(bottom: 10),
                );
              }),
        ],
      ),
    );
  }
}
