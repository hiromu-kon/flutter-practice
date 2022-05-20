// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'memo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Memo _$MemoFromJson(Map<String, dynamic> json) {
  return _Memo.fromJson(json);
}

/// @nodoc
mixin _$Memo {
  String? get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemoCopyWith<Memo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoCopyWith<$Res> {
  factory $MemoCopyWith(Memo value, $Res Function(Memo) then) =
      _$MemoCopyWithImpl<$Res>;
  $Res call({String? id, String content});
}

/// @nodoc
class _$MemoCopyWithImpl<$Res> implements $MemoCopyWith<$Res> {
  _$MemoCopyWithImpl(this._value, this._then);

  final Memo _value;
  // ignore: unused_field
  final $Res Function(Memo) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MemoCopyWith<$Res> implements $MemoCopyWith<$Res> {
  factory _$MemoCopyWith(_Memo value, $Res Function(_Memo) then) =
      __$MemoCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String content});
}

/// @nodoc
class __$MemoCopyWithImpl<$Res> extends _$MemoCopyWithImpl<$Res>
    implements _$MemoCopyWith<$Res> {
  __$MemoCopyWithImpl(_Memo _value, $Res Function(_Memo) _then)
      : super(_value, (v) => _then(v as _Memo));

  @override
  _Memo get _value => super._value as _Memo;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
  }) {
    return _then(_Memo(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Memo extends _Memo {
  const _$_Memo({this.id, required this.content}) : super._();

  factory _$_Memo.fromJson(Map<String, dynamic> json) => _$$_MemoFromJson(json);

  @override
  final String? id;
  @override
  final String content;

  @override
  String toString() {
    return 'Memo(id: $id, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Memo &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$MemoCopyWith<_Memo> get copyWith =>
      __$MemoCopyWithImpl<_Memo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemoToJson(this);
  }
}

abstract class _Memo extends Memo {
  const factory _Memo({final String? id, required final String content}) =
      _$_Memo;
  const _Memo._() : super._();

  factory _Memo.fromJson(Map<String, dynamic> json) = _$_Memo.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MemoCopyWith<_Memo> get copyWith => throw _privateConstructorUsedError;
}
