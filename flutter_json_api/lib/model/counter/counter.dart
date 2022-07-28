import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.freezed.dart';
part 'counter.g.dart';

@freezed
class Counter with _$Counter {
  factory Counter({
    required int counter,
  }) = _Counter;

  factory Counter.fromJson(Map<String, dynamic> json) =>
      _$CounterFromJson(json);
}
