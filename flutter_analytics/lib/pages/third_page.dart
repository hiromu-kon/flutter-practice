import 'package:flutter/material.dart';
import 'package:flutter_analytics/pages/settings_page.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Column(children: [
        ElevatedButton(
          child: const Text('SettingsPageへ'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
                settings: const RouteSettings(name: '設定画面'),
              ),
            );
          },
        )
      ]),
    );
  }
}
