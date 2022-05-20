// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:flutter_sample_app/entities/todo/todo.dart';

/// Todo関連の操作をまとめたクラス
class TodoRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<List<Todo>> fetchTodos({int limit = 100}) async {
    try {
      final snapshot = await _firestore.collection('todos').limit(limit).get();
      final todos = snapshot.docs.map((doc) => Todo.fromDocument(doc)).toList();

      return todos;
    } on FirebaseException catch (e) {
      print('error:${e.toString()}');
      rethrow;
    }
  }

  Future<Todo> fetchTodo(String todoId) async {
    try {
      final snapshot = await _firestore.collection('todos').doc(todoId).get();
      final todo = Todo.fromDocument(snapshot);

      return todo;
    } on FirebaseException catch (e) {
      print('error:${e.toString()}');
      rethrow;
    }
  }

  Future<void> deleteTodo(Todo todo) async {
    try {
      await _firestore.collection('todos').doc(todo.id).delete();
    } on FirebaseException catch (e) {
      print('error:${e.toString()}');
      rethrow;
    }
  }

  Future<void> updateTodo(
      String currentId, String title, String content) async {
    try {
      await _firestore.collection('todo').doc(currentId).update({
        'title': title,
        'content': content,
      });
    } on FirebaseException catch (e) {
      print('error:${e.toString()}');
      rethrow;
    }
  }
}
