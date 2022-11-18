import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseDynamicLinksInstanceProvider =
    Provider((ref) => FirebaseDynamicLinks.instance);

final dynamicLinksServiceProvider = Provider<FirebaseDynamicLinksService>(
    (ref) => FirebaseDynamicLinksService(
        ref.watch(firebaseDynamicLinksInstanceProvider)));

class FirebaseDynamicLinksService {
  FirebaseDynamicLinksService(this._dynamicLinksInstance);

  final FirebaseDynamicLinks _dynamicLinksInstance;

  /// Dynamic Linksの初期化
  Future<void> navigateDynamicLinksIfNeeded() async {
    // 1. アプリを起動させたダイナミックリンクを取得する
    /// DynamicLinks経由の起動じゃなかった場合は`null`が返ってくる
    final linkData = await FirebaseDynamicLinks.instance.getInitialLink();

    // 2. 取り出したリンクを扱う
    await _handleDeepLink(data: linkData);

    // 3. Dynamic Linksを使用してバックグラウンドからアプリを開いた場合のリスナー
    _dynamicLinksInstance.onLink.listen(
      (linkData) async {
        print(linkData);
        // 取り出したリンクを扱う
        await _handleDeepLink(data: linkData);
      },
      onError: (Object exception) async {
        print('onLink error: $exception');
      },
    );
  }

  /// Dynamic Linkに設定したディープリンクをハンドリングする
  Future<void> _handleDeepLink({required PendingDynamicLinkData? data}) async {
    final deepLink = data?.link;
    if (deepLink != null) {
      print(deepLink);
      // URLパスを判定
      if (deepLink.pathSegments.contains('element')) {
        // パラメータからASINを取り出す
        final asin = deepLink.queryParameters['page'];
        if (asin != null) {
          // 画面へ遷移する

        }
      }
    }
  }

  /// アプリでリンクを発行する
  Future<Uri> createDynamicLinks(
      {required String parameter, bool needShort = false}) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://flutterfireapp.page.link', // URL接頭辞
      link: Uri.parse(
          'https://flutterfireapp.page.link/community?query=$parameter'), //デフォルトのDeep Link
      // Android用の設定
      androidParameters: const AndroidParameters(
        packageName: 'com.example.flutterfire_app',
        minimumVersion: 1,
      ),
      // iOS用の設定
      iosParameters: const IOSParameters(
        bundleId: 'com.example.flutterfireApp',
        minimumVersion: '1',
        // appStoreId: 'app_store_id',
        // fallbackUrl: Uri.parse('https://qiita.com/'),
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        description: 'テストの説明文です。',
        imageUrl: Uri.parse(
            'https://plus.unsplash.com/premium_photo-1661508614319-b5e40d1143bb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2F0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
        title: 'テストのタイトルです。',
      ),
      // navigationInfoParameters:
      //     const NavigationInfoParameters(forcedRedirectEnabled: true),
    );

    Uri url;

    if (needShort) {
      final shortLink = await _dynamicLinksInstance.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await _dynamicLinksInstance.buildLink(parameters);
    }

    print(url.toString());
    return url;
  }
}
