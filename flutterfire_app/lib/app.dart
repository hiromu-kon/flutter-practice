import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterfire_app/pages/home_page.dart';
import 'package:flutterfire_app/utils/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.wait<void>([
        // ref.read(initializeFirebaseMessagingProvider)(),
      ]);
      return null;
    });

    return const MaterialApp(
      home: HomePage(),
    );
  }
}
