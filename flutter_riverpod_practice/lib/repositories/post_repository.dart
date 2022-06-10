import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod_practice/entities/post/post.dart';

class PostRepository {
  final _db = FirebaseFirestore.instance;

  Future<void> add(Post post) {}
}
