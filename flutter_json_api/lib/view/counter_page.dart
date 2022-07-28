import 'package:flutter/material.dart';
import 'package:flutter_json_api/provider/counter_provider.dart';
import 'package:flutter_json_api/service/conter_api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterPage extends HookConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: counter.when(
          data: (data) => Text(data.counter.toString()),
          error: (error, stack) => Text('Error ${error}'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterApiProvider).editCounter(counter.value!.counter);
          Navigator.pop(context);
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
