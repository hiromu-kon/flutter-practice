import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends HookConsumerWidget {
  const WebViewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View'),
      ),
      body: WebView(
        initialUrl: 'https://flutter.dev',
      ),
    );
  }
}
