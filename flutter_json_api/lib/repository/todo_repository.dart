import 'package:flutter_json_api/service/todo_api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoRepositoryProvider = Provider<TodoRepository>(
    (ref) => TodoRepository(ref.watch(todoApiProvider)));

class TodoRepository {
  TodoRepository(this._todoApiProvider);

  TodoApiClient _todoApiProvider;

  Future fetchTodos() async {
    return await _todoApiProvider.fetchTodos();
  }
}
