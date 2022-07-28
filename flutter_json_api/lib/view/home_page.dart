import 'package:flutter/material.dart';
import 'package:flutter_json_api/util/router.dart';

/// Home Page
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => goCounterPage(context),
              child: const Text('counter'),
            ),
            ElevatedButton(
              onPressed: () => goTodoListPage(context),
              child: const Text('todos'),
            ),
            ElevatedButton(
              onPressed: () => goTestEditPostPage(context),
              child: const Text('test page'),
            ),
            ElevatedButton(
              onPressed: () => goLoginPage(context),
              child: const Text('login page'),
            ),
            ElevatedButton(
              onPressed: () => goContactNewPage(context),
              child: const Text('contact page'),
            ),
            ElevatedButton(
              onPressed: () => goTestPage(context),
              child: const Text('test page'),
            ),
            ElevatedButton(
              onPressed: () => goTabBarPage(context),
              child: const Text('tabBar page'),
            ),
            ElevatedButton(
              onPressed: () => goSliverPage(context),
              child: const Text('sliver page'),
            ),
            ElevatedButton(
              onPressed: () => goBottomNavigationPage(context),
              child: const Text('botton navigation page'),
            ),
            ElevatedButton(
              onPressed: () => goPageViewPage(context),
              child: const Text('page view page'),
            ),
            ElevatedButton(
              onPressed: () => goUrlPage(context),
              child: const Text('url page'),
            ),
            ElevatedButton(
              onPressed: () => goWebViewPage(context),
              child: const Text('web view page'),
            ),
          ],
        ),
      ),
    );
  }
}
