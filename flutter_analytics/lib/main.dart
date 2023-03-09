import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analytics/firebase_analytics.dart';
import 'package:flutter_analytics/firebase_auth.dart';
import 'package:flutter_analytics/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   static final _observer = FirebaseAnalyticsObserver(
//       analytics: FirebaseAnalytics.instance,
//       nameExtractor: (settings) =>
//           settings.name == '/' ? 'ホーム画面' : settings.name);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       navigatorObservers: [_observer],
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // FirebaseAnalytics.instance.logScreenView(screenName: 'ホーム画面');
//     return Scaffold(
//       appBar: AppBar(),
//       body: ElevatedButton(
//         child: const Text('Next Pageへ'),
//         onPressed: () => Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const NextPage(),
//             settings: const RouteSettings(name: '次の画面'),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NextPage extends StatelessWidget {
//   const NextPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ElevatedButton(
//           child: const Text('Third Pageへ'),
//           onPressed: () {
//             FirebaseAnalytics.instance
//                 .logScreenView(screenClass: 'ThirdPage', screenName: 'サード画面');
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const ThirdPage(),
//                 // settings: const RouteSettings(name: 'サード画面'),
//               ),
//             );
//           }),
//     );
//   }
// }

// class ThirdPage extends StatefulWidget {
//   const ThirdPage({super.key});

//   @override
//   State<ThirdPage> createState() => _ThirdPageState();
// }

// class _ThirdPageState extends State<ThirdPage>
//     with SingleTickerProviderStateMixin {
//   TabController? _tabController;

//   @override
//   void initState() {
//     super.initState();

//     _tabController = TabController(vsync: this, length: 3);
//     _tabController!.addListener(() {
//       _tabController!.index;
//       FirebaseAnalytics.instance
//           .logScreenView(screenName: '${_tabController!.index}画面');
//     });
//   }

//   @override
//   void dispose() {
//     _tabController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('タブ画面移動サンプル'),
//           bottom: TabBar(
//             controller: _tabController,
//             tabs: const <Widget>[
//               Tab(icon: Icon(Icons.cloud_outlined)),
//               Tab(icon: Icon(Icons.beach_access_sharp)),
//               Tab(icon: Icon(Icons.brightness_5_sharp)),
//             ],
//           ),
//         ),
//         body: const TabBarView(
//           children: <Widget>[
//             Center(child: Text('くもり', style: TextStyle(fontSize: 50))),
//             Center(child: Text('雨', style: TextStyle(fontSize: 50))),
//             Center(child: Text('晴れ', style: TextStyle(fontSize: 50))),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _observer = FirebaseAnalyticsObserver(
      analytics: FirebaseAnalytics.instance,
      nameExtractor: (settings) =>
          settings.name == '/' ? 'ホーム画面' : settings.name);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: [_observer],
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Future(() async {
      final token = await FirebaseAuthServices.firebaseUser?.getIdToken();
      final b = await FirebaseAuthServices.firebaseUser?.getIdTokenResult();
      final a = await FirebaseAuthServices.firebaseUser;
      print(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Auth'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final credential = await FirebaseAuthServices.signIn(
                  email: 'hiro.0405soccer@icloud.com', password: 'HHHHHHHH');
              final token = await credential.getIdToken();
              print(token);
            },
            child: const Text('ログイン'),
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuthServices.signOut();
            },
            child: const Text('ログアウト'),
          )
        ],
      ),
    );
  }
}
