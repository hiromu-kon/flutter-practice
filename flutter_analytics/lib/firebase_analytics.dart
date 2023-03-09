// ignore_for_file: constant_identifier_names

import 'package:firebase_analytics/firebase_analytics.dart';

/// アナリティクスイベント
enum AnalyticsEvent {
  button,
  click_article,
}

class AnalyticsService {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  Future<void> logPage(String screenName) async {
    await analytics.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': screenName,
      },
    );
  }

  Future<void> logBeginCheckout() async {
    analytics.logBeginCheckout();
  }

  Future<void> setCurrentScreen(String screenName) async {
    await analytics.setCurrentScreen(screenName: screenName);
  }

  /// 記事クリックベント送信
  Future<void> sendClickArticlePageEvent({required String title}) async {
    sendEvent(event: AnalyticsEvent.click_article, parameterMap: {
      'buttonName': "記事クリック",
      "article_id": 3,
      'title': '大人気のヘアケアシリーズ4'
    });
  }

  /// ボタンタップイベント送信
  Future<void> sendButtonEvent({required String buttonName}) async {
    sendEvent(
        event: AnalyticsEvent.button, parameterMap: {'buttonName': buttonName});
  }

  /// イベントを送信する
  /// [event] AnalyticsEvent
  /// [parameterMap] パラメータMap
  Future<void> sendEvent(
      {required AnalyticsEvent event,
      Map<String, dynamic>? parameterMap}) async {
    final eventName = event.toString().split('.')[1];
    analytics.logEvent(
      name: eventName,
      parameters: parameterMap,
    );
  }

  Future<void> sendScreenView(String screenName) async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': screenName,
        'firebase_screen_class': 'HomePage',
      },
    );
  }
}
