import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo/data/model/todo_model.dart';

class TodoItem extends ConsumerWidget {
  final TodoModel todo;

  const TodoItem({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(todo.id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${todo.title} deleted'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 16),
        child: ListTile(
          leading: Checkbox(
            value: todo.isCompleted,
            onChanged: (_) {
            },
          ),
          title: Text(
            todo.title,
            style: TextStyle(
              fontSize: 16,
              decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
              color: todo.isCompleted ? Colors.grey : Colors.black,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
            },
          ),
        ),
      ),
    );
  }
}
