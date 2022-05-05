// Dart imports:
import 'dart:async';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart' as auth;

// Project imports:
import 'package:flutter_sample_app/domain/user_state.dart';

class AppModel {
  AppModel() {
    _init();
  }

  final _userStateStreamController = StreamController<UserState?>();
  Stream<UserState?> get userState => _userStateStreamController.stream;

  UserState? _state;

  /// 初期化処理
  Future<void> _init() async {
    // ログイン状態の変化を監視し、変更があればUserStateをstreamで通知する
    auth.FirebaseAuth.instance.authStateChanges().listen((firebaseUser) async {
      _state = firebaseUser != null ? UserState.member : UserState.noLogin;

      // すぐに SplashPage が閉じてしまうので少し待つ
      await Future<dynamic>.delayed(const Duration(milliseconds: 1500));

      _userStateStreamController.sink.add(_state);
    });
  }

  void dispose() {
    _userStateStreamController.close();
  }
}
