// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo.freezed.dart';
part 'memo.g.dart';

@freezed
abstract class Memo implements _$Memo {
  const Memo._();

  const factory Memo({
    String? id,
    required String content,
  }) = _Memo;

  factory Memo.empty() => Memo(content: '');

  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);

  // ドキュメントのスナップショットを変換するために利用
  factory Memo.fromDocument(doc) {
    final data = doc.data()!;

    return Memo.fromJson(data).copyWith(id: doc.id);
  }

  // アイテムモデルをMap<String, dynamic>に変換するメソッド
  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
