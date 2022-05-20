// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:flutter_sample_app/entities/user/user.dart';

/// User関連の操作をまとめたクラス
class UserRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<List<User>> fetchUsers({int limit = 100}) async {
    try {
      final snapshot = await _firestore.collection('users').limit(limit).get();
      final users = snapshot.docs.map((doc) => User.fromDocument(doc)).toList();

      return users;
    } on FirebaseException catch (e) {
      print('error:${e.toString()}');
      rethrow;
    }
  }
}
