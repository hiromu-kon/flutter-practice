import 'package:flutter/material.dart';
import 'package:flutter_sample_app/domain/todo.dart';
import 'package:flutter_sample_app/repository/todo_repository.dart';

class TodoModel with ChangeNotifier {
  TodoModel() {
    _init();
  }

  final _todoRepo = TodoRepository();

  List<Todo>? todos;

  Future _init() async {
    await fetchTodos();
    notifyListeners();
  }

  Future<void> fetchTodos() async {
    todos = await _todoRepo.fetchTodos();
  }
}
