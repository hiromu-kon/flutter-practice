import 'package:flutter_json_api/model/model.dart';
import 'package:flutter_json_api/service/conter_api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterRepositoryProvider = Provider<CounterRepository>(
  (ref) => CounterRepository(ref.watch(counterApiProvider)),
);

class CounterRepository {
  CounterRepository(
    this._counterApiProvider,
  );

  final CounterApiClient _counterApiProvider;

  Future<Counter> fetchCounter() async {
    final counter = await _counterApiProvider.fetchCounter();
    return counter;
  }
}
