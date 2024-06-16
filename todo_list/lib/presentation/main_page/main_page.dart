import 'package:flutter/material.dart';
import 'package:todo_list/app_ui_kit/app_ui_kit.dart';
import 'package:todo_list/main_page/presentation/widgets/todo_list_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
              title: const LargeTitle('Мои дела'),
            ),
          ),
          SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return TodoListItem(
                subtitle: 'Data',
                title:
                    'Title reuterit re retuieriyt 34 Title reuterit re retuieriyt 34 Title reuterit re retuieriyt 34 Title reuterit re retuieriyt 34 Title reuterit re retuieriyt 34 Title reuterit re retuieriyt 34 Title reuterit re retuieriyt 34 Title reuterit re retuieriyt 34 ',
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}
