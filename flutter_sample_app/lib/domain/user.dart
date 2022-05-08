// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User implements _$User {
  const User._();

  const factory User({
    String? id,
    required String name,
    required String email,
  }) = _User;

  factory User.empty() => const User(name: '', email: '');

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // ドキュメントのスナップショットを変換するために利用
  factory User.fromDocument(doc) {
    final data = doc.data()!;

    return User.fromJson(data).copyWith(id: doc.id);
  }

  // アイテムモデルをMap<String, dynamic>に変換するメソッド
  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
