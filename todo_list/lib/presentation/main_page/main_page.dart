import 'package:flutter/material.dart';
import 'package:todo_list/app_ui_kit/app_ui_kit.dart';
import 'package:todo_list/domain/mock_data.dart';
import 'package:todo_list/presentation/main_page/widgets/todo_list_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: AppColors.blue,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // appBar: AppBar(
      //   title: Text(
      //     'Мои дела',
      //     style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.white),
      //   ),

      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 150,
            backgroundColor: AppColors.blue,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/clouds.jpg',
                fit: BoxFit.cover,
              ),
              title: const Text(
                'Мои дела',
                // style: Theme.of(context).textTheme.displayLarge?.copyWith(
                //       color: AppColors.white,
                //     ),
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //     // child: Padding(),
          //     ),
          SliverList.builder(
            itemCount: mockTasks.length,
            itemBuilder: (context, index) {
              final task = mockTasks[index];
              return TodoListItem(
                task: task,
                onDone: () => setState(() {
                  mockTasks[index] = task.copyWith(isDone: true);
                }),
                onDelete: () => setState(() {
                  mockTasks.removeAt(index);
                }),
                onCheckBoxChange: (value) => setState(() {
                  mockTasks[index] = task.copyWith(isDone: value ?? false);
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
