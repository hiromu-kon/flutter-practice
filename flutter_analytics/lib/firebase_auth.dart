import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  static final _auth = FirebaseAuth.instance;

  static Future<User> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 初回ログインかどうか
      print('初回かどうか: ${credential.additionalUserInfo}');
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw (_convertErrorMessage(e));
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
    final a = _auth.currentUser;
    print(a);
  }

  static User? get firebaseUser => _auth.currentUser;

  bool get isLogin => _auth.currentUser != null;
}

String _convertErrorMessage(e) {
  switch (e.code) {
    case 'invalid-email':
      return 'メールアドレスを正しい形式で入力してください';
    case 'user-not-found':
      return 'ユーザーが存在しません';
    case 'wrong-password':
      return 'パスワードが間違っています';
    default:
      return '不明なエラーです';
  }
}
