import 'package:my_todo/data/model/todo_model.dart';

abstract class ITodosDbService {
  Future<void> saveTodos(List<TodoModel> todos);
  List<TodoModel> getTodos();
  Future<void> clearTodos();
}
