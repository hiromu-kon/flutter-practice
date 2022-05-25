// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:flutter_sample_app/entities/memo/memo.dart';

/// Memo関連の操作をまとめたクラス
class MemoRepository {
  final _firestore = FirebaseFirestore.instance;

  Stream<List<Memo>> fetchMemos({int limit = 100}) {
    try {
      return _firestore
          .collection('memos')
          .limit(limit)
          .orderBy('content')
          .snapshots()
          .map((event) => event.docs.map((e) => Memo.fromDocument(e)).toList());
    } on FirebaseException catch (e) {
      print('error:${e.toString()}');
      rethrow;
    }
  }

  Future<bool> addMemo(content) async {
    try {
      await _firestore.collection('memos').add({
        'content': content,
      });

      return true;
    } on FirebaseException catch (e) {
      print('error:${e.toString()}');
      rethrow;
    }
  }

  Future<bool> updateTodo(
    String currentId,
    String content,
  ) async {
    try {
      await _firestore.collection('memos').doc(currentId).update({
        'content': content,
      });

      return true;
    } on FirebaseException catch (e) {
      print('error:${e.toString()}');
      rethrow;
    }
  }

  // Stream<QuerySnapshot> fetchMemos({int limit = 100}) {
  //   try {
  //     return _firestore.collection('memos').snapshots();
  //   } on FirebaseException catch (e) {
  //     print('error:${e.toString()}');
  //     rethrow;
  //   }
  // }
}
