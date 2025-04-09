import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo/data/model/todo_model.dart';
import 'package:my_todo/data/service/todo_db/i_todo_db_service.dart';

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  final ITodosDbService _dbService;

  TodoNotifier(this._dbService) : super([]) {
    _loadTodos();
  }

  void _loadTodos() {
    final todos = _dbService.getTodos();
    state = todos;
  }

  Future<void> addTodo(String title) async {
    final newTodo = TodoModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
    );

    final updatedTodos = [...state, newTodo];
    state = updatedTodos;
    await _dbService.saveTodos(updatedTodos);
  }

  Future<void> toggleTodo(String id) async {
    // Find the todo that's being toggled
    final todoToToggle = state.firstWhere((todo) => todo.id == id);
    final isBeingCompleted = !todoToToggle.isCompleted;

    // Remove the todo from the current list
    final remainingTodos = state.where((todo) => todo.id != id).toList();

    // Create the updated todo with toggled status
    final updatedTodo = todoToToggle.copyWith(isCompleted: !todoToToggle.isCompleted);

    List<TodoModel> updatedTodos;

    if (isBeingCompleted) {
      // If the todo is being completed, add it to the end (bottom)
      updatedTodos = [...remainingTodos, updatedTodo];
    } else {
      // If the todo is being marked as incomplete, add it to the beginning (top)
      updatedTodos = [updatedTodo, ...remainingTodos];
    }

    state = updatedTodos;
    await _dbService.saveTodos(updatedTodos);
  }

  Future<void> deleteTodo(String id) async {
    final updatedTodos = state.where((todo) => todo.id != id).toList();
    state = updatedTodos;
    await _dbService.saveTodos(updatedTodos);
  }
}
