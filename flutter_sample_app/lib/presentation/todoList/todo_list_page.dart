// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:flutter_sample_app/presentation/todoList/todo_list_model.dart';
import 'package:flutter_sample_app/utils/dialog_utils.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoListModel>(
      create: (_) => TodoListModel(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Todo Page'),
        ),
        body: Consumer<TodoListModel>(
          builder: (context, model, child) {
            final todos = model.todos;

            if (todos == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                await model.fetchTodos();
              },
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Slidable(
                    endActionPane:
                        ActionPane(motion: const ScrollMotion(), children: [
                      SlidableAction(
                        onPressed: (BuildContext context) async {
                          final dialogResult = await showConfirmDialog(context,
                              '『${todos[index].title}』を\n削除してもよろしいですか？');

                          if (dialogResult) {
                            await model.deleteTodo(todos[index]);
                          }
                        },
                        icon: Icons.delete,
                        backgroundColor: Colors.red,
                        label: '削除',
                      ),
                    ]),
                    child: ListTile(
                      onTap: () {
                        // Todo: 更新処理

                        print('タップされました。');
                      },
                      title: Text(todos[index].title),
                      subtitle: Text(todos[index].content),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
