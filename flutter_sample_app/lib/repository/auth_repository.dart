// Package imports:
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import 'package:flutter_sample_app/extension/string_extension.dart';

/// 認証関連の操作をまとめたクラス
class AuthRepository {
  final _auth = FirebaseAuth.instance;

  /// [email]と[password]を使ってfirebaseAuthに登録し、認証メールを送信
  Future<UserCredential> createUserWithEmail(
      String email, String password) async {
    if (email.isBlank()) {
      throw const FormatException('メールアドレスを入力してください');
    }
    if (password.isBlank()) {
      throw const FormatException('パスワードを入力してください');
    }

    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw _convertErrorMessage(e.code).toString();
    } catch (e) {
      throw e.toString();
    }
  }

  /// [email]と[password]を使ってサインインする
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    if (email.isBlank()) {
      throw const FormatException('メールアドレスを入力してください');
    }
    if (password.isBlank()) {
      throw const FormatException('パスワードを入力してください');
    }

    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw _convertErrorMessage(e.code).toString();
    } catch (e) {
      throw e.toString();
    }
  }

  void signOut() {
    _auth.signOut();
  }

  String _convertErrorMessage(String errorMassage) {
    switch (errorMassage) {
      case 'weak-password':
        return '安全なパスワードではありません';
      case 'email-already-in-use':
        return 'メールアドレスがすでに使われています';
      case 'invalid-email':
        return 'メールアドレスを正しい形式で入力してください';
      case 'operation-not-allowed':
        return '登録が許可されていません';
      case 'wrong-password':
        return 'パスワードが間違っています';
      case 'user-not-found':
        return 'ユーザーが見つかりません';
      case 'user-disabled':
        return 'ユーザーが無効です';
      default:
        return '不明なエラーです';
    }
  }
}
