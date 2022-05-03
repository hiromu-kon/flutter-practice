import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sample_app/domain/todo.dart';

class TodoRepository {
  Future<List<Todo>> fetchTodos() async {
    final snapshot = await FirebaseFirestore.instance.collection('todos').get();

    final todos = snapshot.docs.map((doc) => Todo.fromDocument(doc)).toList();
    return todos;
  }
}
