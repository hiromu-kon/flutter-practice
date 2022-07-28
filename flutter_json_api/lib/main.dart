import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_json_api/view/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.red,
  ));
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    logger.v('Hello logger!');
    logger.d(1000);
    logger.i(true);
    logger.w([1, 2, 3]);
    logger.e({'key': 'key', 'value': 'value'});
    logger.wtf(Exception('例外もいけます'));
    logger.i(() => '関数もいけます');

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        // appBarTheme: AppBarTheme(
        //   backgroundColor: Colors.white,
        //   titleTextStyle: TextStyle(
        //     color: Colors.black,
        //     fontSize: 24,
        //     fontWeight: FontWeight.bold,
        //   ),
        //   centerTitle: false,
        //   elevation: 0,
        // ),
      ),
      home: const HomePage(),
    );
  }
}
