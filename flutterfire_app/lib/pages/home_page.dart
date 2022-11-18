import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterfire_app/utils/firebase_dynamic_links.dart';
// import 'package:flutterfire_app/utils/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dynamicLinks = ref.watch(dynamicLinksServiceProvider);

    useEffect(
      () {
        // 初回表示時のみ実行
        dynamicLinks.navigateDynamicLinksIfNeeded();

        return null;
      },
      const [],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Icon(Icons.abc),
          onPressed: () => ref
              .read(dynamicLinksServiceProvider)
              .createDynamicLinks(parameter: '1', needShort: true),
        ),
      ),
    );
  }
}
