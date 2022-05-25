// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:flutter_sample_app/gen/assets.gen.dart';
import 'package:flutter_sample_app/presentation/userList/user_list_model.dart';
import 'package:flutter_sample_app/utils/dialog_utils.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserListModel>(
      create: (_) => UserListModel(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Todo Page'),
        ),
        body: Consumer<UserListModel>(builder: (context, model, child) {
          final users = model.users;

          print(users);

          if (users == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(users[index].name),
                subtitle: Text(users[index].email),
              );
            },
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Widget widget = Assets.avatar.image(
              width: 50.0,
            );

            final isYes = await showWidgetDialog(
              context,
              'メモ編集',
              widget,
            );
          },
          child: const Icon(Icons.plus_one),
        ),
      ),
    );
  }
}
