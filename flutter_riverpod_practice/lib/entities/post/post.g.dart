// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      id: json['id'] as String,
      content: json['content'] as String,
      postAccountId: json['postAccountId'] as String,
      createdTime: DateTime.parse(json['createdTime'] as String),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'postAccountId': instance.postAccountId,
      'createdTime': instance.createdTime.toIso8601String(),
    };
