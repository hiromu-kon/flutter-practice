import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice/views/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: themeNavy,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardTheme: const CardTheme(
          margin: EdgeInsets.zero,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 1,
          toolbarHeight: 48,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

const primaryNavyColor = Color(0xFF0050aa);

const MaterialColor themeNavy = MaterialColor(
  0xFF0050aa,
  <int, Color>{
    50: primaryNavyColor,
    100: primaryNavyColor,
    200: primaryNavyColor,
    300: primaryNavyColor,
    400: primaryNavyColor,
    500: primaryNavyColor,
    600: primaryNavyColor,
    700: primaryNavyColor,
    800: primaryNavyColor,
    900: primaryNavyColor,
  },
);
