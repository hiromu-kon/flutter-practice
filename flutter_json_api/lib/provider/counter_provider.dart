import 'package:flutter_json_api/model/model.dart';
import 'package:flutter_json_api/repository/counter_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = FutureProvider.autoDispose<Counter>((ref) {
  final counter = ref.watch(counterRepositoryProvider).fetchCounter();
  return counter;
});
