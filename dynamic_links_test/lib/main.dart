import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Future<Uri> _buildDynamicLink() async {
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse("https://www.example.com/"),
      uriPrefix: "https://dynamiclinkstest11.page.link",
      androidParameters: const AndroidParameters(
        packageName: "com.example.dynamic_links_test",
        minimumVersion: 1,
      ),
      iosParameters: const IOSParameters(
        bundleId: "com.example.dynamicLinksTest",
        appStoreId: "123456789",
      ),
      googleAnalyticsParameters: const GoogleAnalyticsParameters(
        source: "twitter",
        medium: "social",
        campaign: "example-promo",
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: "Example of a Dynamic Link",
        imageUrl: Uri.parse("https://example.com/image.png"),
      ),
    );
    return (await FirebaseDynamicLinks.instance
            .buildShortLink(dynamicLinkParams))
        .shortUrl;
  }

  void _openDynamicLink() async {
    final url = await _buildDynamicLink();
    print(url);
    launchUrl((url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _openDynamicLink,
            child: const Text('Open Dynamic Link'),
          ),
        ));
  }
}
