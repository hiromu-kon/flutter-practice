import 'package:dio/dio.dart';
import 'package:flutter_json_api/model/model.dart';
import 'package:flutter_json_api/util/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoApiProvider = Provider<TodoApiClient>((ref) => TodoApiClient());

class TodoApiClient {
  Future fetchTodos() async {
    await Future.delayed(Duration(seconds: 2));
    final Response<List> response = await Dio().get<List>('$apiUrl/todos');
    final data = response.data;

    try {
      return data?.map((data) => Todo.fromJson(data)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
