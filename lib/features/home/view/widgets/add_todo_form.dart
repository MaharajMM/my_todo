import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo/features/home/controller/todo_provider.dart';

class AddTodoForm extends ConsumerStatefulWidget {
  const AddTodoForm({super.key});

  @override
  ConsumerState<AddTodoForm> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends ConsumerState<AddTodoForm> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addTodo() {
    final title = _controller.text.trim();
    if (title.isNotEmpty) {
      ref.read(todoProvider.notifier).addTodo(title);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Add a new todo...',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _addTodo(),
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: _addTodo,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
