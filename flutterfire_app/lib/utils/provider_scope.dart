import 'package:flutterfire_app/utils/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// RootProviderScope で指定する List<Override> を取得する。
Future<List<Override>> get providerScopeOverrides async {
  return <Override>[
    // firebaseMessagingProvider.overrideWithValue(
    //   await getFirebaseMessagingInstance,
    // ),
  ];
}
