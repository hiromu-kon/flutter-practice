// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_sample_app/presentation/imageList/image_list_page.dart';
import 'package:flutter_sample_app/presentation/login/login_page.dart';
import 'package:flutter_sample_app/presentation/memoList/memo_list_page.dart';
import 'package:flutter_sample_app/presentation/todoList/todo_list_page.dart';
import 'package:flutter_sample_app/presentation/userList/user_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: const Text('ログイン'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TodoListPage()));
              },
              child: const Text('Todo一覧'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserListPage()));
              },
              child: const Text('User一覧'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MemoListPage()));
              },
              child: const Text('Memo一覧'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ImageListPage()));
              },
              child: const Text('Image一覧'),
            ),
          ],
        ),
      ),
    );
  }
}
