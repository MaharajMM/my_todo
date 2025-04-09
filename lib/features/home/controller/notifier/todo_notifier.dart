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
    final updatedTodos = state.map((todo) {
      if (todo.id == id) {
        return todo.copyWith(isCompleted: !todo.isCompleted);
      }
      return todo;
    }).toList();

    state = updatedTodos;
    await _dbService.saveTodos(updatedTodos);
  }

  Future<void> deleteTodo(String id) async {
    final updatedTodos = state.where((todo) => todo.id != id).toList();
    state = updatedTodos;
    await _dbService.saveTodos(updatedTodos);
  }
}
