import 'package:dio/dio.dart';
import 'package:flutter_json_api/model/model.dart';
import 'package:flutter_json_api/util/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterApiProvider =
    Provider<CounterApiClient>((ref) => CounterApiClient());

class CounterApiClient {
  Future<Counter> fetchCounter() async {
    await Future.delayed(Duration(seconds: 2));
    final Response<List> response = await Dio().get<List>('$apiUrl/counter');
    final data = response.data![0];

    try {
      return Counter.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editCounter(int prevCounter) async {
    await Dio().put('$apiUrl/counter/1', data: {'counter': prevCounter + 1});
  }
}
