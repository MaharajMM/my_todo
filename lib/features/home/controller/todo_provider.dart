import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo/data/model/todo_model.dart';
import 'package:my_todo/data/service/todo_db/todo_db_service_pod.dart';
import 'package:my_todo/features/home/controller/notifier/todo_notifier.dart';

final todoProvider = StateNotifierProvider<TodoNotifier, List<TodoModel>>((ref) {
  final dbService = ref.watch(todoDbServiceProvider);
  return TodoNotifier(dbService);
});
