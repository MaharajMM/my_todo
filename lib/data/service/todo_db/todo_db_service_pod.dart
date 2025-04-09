import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo/core/local_storage/app_storage_pod.dart';
import 'package:my_todo/data/service/todo_db/todo_db_service.dart';

final todoDbServiceProvider = Provider.autoDispose<TodosDbService>(
  (ref) {
    return TodosDbService(appStorage: ref.watch(appStorageProvider));
  },
);
