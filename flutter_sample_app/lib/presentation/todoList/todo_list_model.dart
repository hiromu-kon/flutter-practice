// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_sample_app/domain/todo/todo.dart';
import 'package:flutter_sample_app/repository/todo_repository.dart';

class TodoListModel with ChangeNotifier {
  TodoListModel() {
    _init();
  }

  final _todoRepo = TodoRepository();

  List<Todo>? todos;

  Future _init() async {
    await fetchTodos();
  }

  Future<void> fetchTodos() async {
    todos = await _todoRepo.fetchTodos();

    notifyListeners();
  }

  Future<void> deleteTodo(Todo todo) async {
    await _todoRepo.deleteTodo(todo);
  }
}
