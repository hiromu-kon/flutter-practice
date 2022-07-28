import 'package:flutter_json_api/repository/todo_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todosProvider = FutureProvider.autoDispose((ref) async {
  final todos = ref.watch(todoRepositoryProvider).fetchTodos();
  return todos;
});
