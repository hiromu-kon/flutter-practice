import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutterfire_app/app.dart';
import 'package:flutterfire_app/utils/firebase_messaging.dart';
import 'package:flutterfire_app/firebase_options.dart';
import 'package:flutterfire_app/utils/provider_scope.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   RemoteNotification? notification = message.notification;
// flnp.initialize(const InitializationSettings(
//     android: AndroidInitializationSettings('@mipmap/ic_launcher')));

// if (notification == null) {
//   return;
// }
// 通知
// flnp.show(
//     notification.hashCode,
//     "${notification.title}:バックグラウンド",
//     notification.body,
//     const NotificationDetails(
//       android: AndroidNotificationDetails(
//         'channel_id',
//         'channel_name',
//       ),
//     ));
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseMessagingService().background();

  // final PendingDynamicLinkData? initialLink =
  //     await FirebaseDynamicLinks.instance.getInitialLink();
  runApp(
    ProviderScope(
      overrides: await providerScopeOverrides,
      child: const App(),
    ),
  );
}
