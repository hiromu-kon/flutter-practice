// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'counter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Counter _$CounterFromJson(Map<String, dynamic> json) {
  return _Counter.fromJson(json);
}

/// @nodoc
mixin _$Counter {
  int get counter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CounterCopyWith<Counter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterCopyWith<$Res> {
  factory $CounterCopyWith(Counter value, $Res Function(Counter) then) =
      _$CounterCopyWithImpl<$Res>;
  $Res call({int counter});
}

/// @nodoc
class _$CounterCopyWithImpl<$Res> implements $CounterCopyWith<$Res> {
  _$CounterCopyWithImpl(this._value, this._then);

  final Counter _value;
  // ignore: unused_field
  final $Res Function(Counter) _then;

  @override
  $Res call({
    Object? counter = freezed,
  }) {
    return _then(_value.copyWith(
      counter: counter == freezed
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_CounterCopyWith<$Res> implements $CounterCopyWith<$Res> {
  factory _$$_CounterCopyWith(
          _$_Counter value, $Res Function(_$_Counter) then) =
      __$$_CounterCopyWithImpl<$Res>;
  @override
  $Res call({int counter});
}

/// @nodoc
class __$$_CounterCopyWithImpl<$Res> extends _$CounterCopyWithImpl<$Res>
    implements _$$_CounterCopyWith<$Res> {
  __$$_CounterCopyWithImpl(_$_Counter _value, $Res Function(_$_Counter) _then)
      : super(_value, (v) => _then(v as _$_Counter));

  @override
  _$_Counter get _value => super._value as _$_Counter;

  @override
  $Res call({
    Object? counter = freezed,
  }) {
    return _then(_$_Counter(
      counter: counter == freezed
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Counter implements _Counter {
  _$_Counter({required this.counter});

  factory _$_Counter.fromJson(Map<String, dynamic> json) =>
      _$$_CounterFromJson(json);

  @override
  final int counter;

  @override
  String toString() {
    return 'Counter(counter: $counter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Counter &&
            const DeepCollectionEquality().equals(other.counter, counter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(counter));

  @JsonKey(ignore: true)
  @override
  _$$_CounterCopyWith<_$_Counter> get copyWith =>
      __$$_CounterCopyWithImpl<_$_Counter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CounterToJson(this);
  }
}

abstract class _Counter implements Counter {
  factory _Counter({required final int counter}) = _$_Counter;

  factory _Counter.fromJson(Map<String, dynamic> json) = _$_Counter.fromJson;

  @override
  int get counter;
  @override
  @JsonKey(ignore: true)
  _$$_CounterCopyWith<_$_Counter> get copyWith =>
      throw _privateConstructorUsedError;
}
