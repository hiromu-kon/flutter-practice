import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod_practice/entities/account/account.dart';

class UserRepository {
  final _db = FirebaseFirestore.instance;

  Future<dynamic> add(Account account) async {
    try {
      await _db.collection('users').doc(account.id).set({
        'name': account.name,
        'user_id': account.userId,
        'self_introduction': account.selfIntroduction,
        'image_path': account.imagePath,
        'created_time': Timestamp.now(),
        'updated_time': Timestamp.now()
      });

      print('新規ユーザー作成完了');
      return true;
    } catch (e) {
      print('新規ユーザー作成エラー $e');

      return false;
    }
  }
}
