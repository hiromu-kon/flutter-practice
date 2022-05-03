import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
abstract class Todo implements _$Todo {
  const Todo._();

  const factory Todo({
    String? id,
    required String title,
    required String content,
  }) = _Todo;

  factory Todo.empty() => Todo(title: '', content: '');

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  // ドキュメントのスナップショットを変換するために利用
  factory Todo.fromDocument(doc) {
    final data = doc.data()!;

    return Todo.fromJson(data).copyWith(id: doc.id);
  }

  // アイテムモデルをMap<String, dynamic>に変換するメソッド
  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
