import 'package:flutter/material.dart';
import 'package:flutter_analytics/pages/third_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Third Pageへ'),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const ThirdPage(),
            //     settings: const RouteSettings(name: 'Third画面'),
            //   ),
            // );
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
