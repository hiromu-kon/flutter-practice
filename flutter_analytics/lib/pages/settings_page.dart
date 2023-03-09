import 'package:flutter/material.dart';
import 'package:flutter_analytics/firebase_analytics.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('戻る'),
            ),
            ElevatedButton(
              onPressed: () {
                AnalyticsService().sendClickArticlePageEvent(title: '');
              },
              child: const Text('ブログを開く'),
            ),
          ],
        ),
      ),
    );
  }
}
