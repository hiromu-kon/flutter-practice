import 'package:flutter/material.dart';
import 'package:flutter_json_api/view/bottom_navigation_page.dart';
import 'package:flutter_json_api/view/contact_page/contact_confirm_page.dart';
import 'package:flutter_json_api/view/contact_page/contact_finish_page.dart';
import 'package:flutter_json_api/view/contact_page/contact_new_page.dart';
import 'package:flutter_json_api/view/counter_page.dart';
import 'package:flutter_json_api/view/edit_password_page.dart';
import 'package:flutter_json_api/view/home_page.dart';
import 'package:flutter_json_api/view/login_page.dart';
import 'package:flutter_json_api/view/page_view_page.dart';
import 'package:flutter_json_api/view/sliver_page.dart';
import 'package:flutter_json_api/view/tabbar_page.dart';
import 'package:flutter_json_api/view/test_edit_post_page.dart';
import 'package:flutter_json_api/view/test_page.dart';
import 'package:flutter_json_api/view/todo_list_page.dart';
import 'package:flutter_json_api/view/url_page.dart';
import 'package:flutter_json_api/view/web_view_page.dart';

Future<void> goHomePage(BuildContext context) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => const HomePage(),
    ),
  );
}

Future<void> goCounterPage(BuildContext context) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => const CounterPage(),
    ),
  );
}

Future<void> goTodoListPage(BuildContext context) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => const TodoListPage(),
    ),
  );
}

Future<void> goTestEditPostPage(BuildContext context) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute(
      builder: ((BuildContext context) => TestEditPostPage()),
    ),
  );
}

Future<void> goLoginPage(BuildContext context) async {
  await Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: ((BuildContext context) => LoginPage()),
    ),
    (route) => false,
  );
}

Future<void> goEditPasswordPage(BuildContext context) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute(
      builder: ((BuildContext context) => EditPasswordPage()),
    ),
  );
}

Future<void> goContactNewPage(BuildContext context) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute(
      builder: ((BuildContext context) => ContactNewPage()),
    ),
  );
}

Future<void> goContactConfirmPage(BuildContext context) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute(
      builder: ((BuildContext context) => ContactConfirmPage()),
    ),
  );
}

Future<void> goContactFinishPage(BuildContext context) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute(
      builder: ((BuildContext context) => ContactFinishPage()),
    ),
  );
}

Future<void> goTestPage(BuildContext context) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute(
      builder: ((BuildContext context) => TestPage()),
    ),
  );
}

Future<void> goTabBarPage(BuildContext context) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute(
      builder: ((BuildContext context) => TabBarPage()),
    ),
  );
}

Future<void> goSliverPage(BuildContext context) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute(
      builder: ((BuildContext context) => SliverPage()),
    ),
  );
}

Future<void> goBottomNavigationPage(BuildContext context) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute(
      builder: ((BuildContext context) => BottomNavigationPage()),
    ),
  );
}

Future<void> goPageViewPage(BuildContext context) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute(
      builder: ((BuildContext context) => PageViewPage()),
    ),
  );
}

Future<void> goUrlPage(BuildContext context) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute(
      builder: ((BuildContext context) => UrlPage()),
    ),
  );
}

Future<void> goWebViewPage(BuildContext context) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute(
      builder: ((BuildContext context) => WebViewPage()),
    ),
  );
}
