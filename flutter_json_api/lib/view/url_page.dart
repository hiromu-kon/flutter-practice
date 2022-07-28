import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlPage extends HookConsumerWidget {
  const UrlPage({Key? key}) : super(key: key);

  Future _launchInBrowser(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  Future _launchInApp(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Googleに遷移'),
              onPressed: () => _launchInApp(Uri.parse('https://google.com')),
            ),
            ElevatedButton(
              child: Text('GitHubに遷移'),
              onPressed: () =>
                  _launchInBrowser(Uri.parse('https://github.com/hiromu-kon')),
            ),
          ],
        ),
      ),
    );
  }
}
