import 'dart:convert';

import 'package:my_todo/core/local_storage/app_storage.dart';
import 'package:my_todo/data/model/todo_model.dart';

import 'i_todo_db_service.dart';

class TodosDbService implements ITodosDbService {
  final AppStorage appStorage;
  final String boxKey = 'todos';

  TodosDbService({required this.appStorage});

  @override
  Future<void> saveTodos(List<TodoModel> books) async {
    final box = appStorage.appBox;
    final encodedBooks = jsonEncode(books.map((b) => b.toMap()).toList());
    await box?.put(boxKey, encodedBooks);
  }

  @override
  List<TodoModel> getTodos() {
    final box = appStorage.appBox;
    final todosString = box?.get(boxKey) as String?;
    if (todosString == null) return [];

    final decoded = jsonDecode(todosString) as List<dynamic>;
    return decoded.map((item) => TodoModel.fromMap(item)).toList();
  }

  @override
  Future<void> clearTodos() async {
    final box = appStorage.appBox;
    await box?.delete(boxKey);
  }
}
