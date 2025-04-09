import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo/const/colors/app_colors.dart';
import 'package:my_todo/data/model/todo_model.dart';
import 'package:my_todo/features/home/view/widgets/todo_item.dart';

class TodoList extends ConsumerWidget {
  final List<TodoModel> todos;

  const TodoList({
    super.key,
    required this.todos,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (todos.isEmpty) {
      return Center(
        child: Text(
          'No todos yet. Add one!',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.grey400,
              ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoItem(todo: todo);
      },
    );
  }
}
