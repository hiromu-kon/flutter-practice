import 'package:flutter/material.dart';
import 'package:flutter_json_api/provider/todos_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoListPage extends HookConsumerWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> _refresh() async {
      await ref.refresh(todosProvider);
    }

    final todos = ref.watch(todosProvider);
    return Scaffold(
      appBar: AppBar(),
      body: todos.when(
        data: (todo) {
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              itemCount: todo.length,
              itemBuilder: (BuildContext context, int index) {
                print(todo);
                return ListTile(
                  title: Text(todo[index].title),
                  subtitle: Text(todo[index].content),
                );
              },
            ),
          );
        },
        error: (object, e) => Text('error'),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.plus_one_rounded),
      ),
    );
  }
}
