import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sample/next_page.dart';
import 'package:sample/tabbar_page.dart';
import 'package:sample/test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = '次へ';

  List<String> popupMenuItems = ['A', 'B', 'C'];
  String selectedValue = 'A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: false,
        title: Text('Hiromuの勉強'),
        flexibleSpace: Image.network(
          'https://images.unsplash.com/photo-1513407030348-c983a97b98d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80',
          fit: BoxFit.cover,
        ),
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        actions: [
          PopupMenuButton(
            initialValue: selectedValue,
            onSelected: (String newValue) {
              setState(() {
                selectedValue = newValue;
              });
            },
            itemBuilder: (context) {
              return popupMenuItems
                  .map((e) => PopupMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            PopupMenuButton(
              initialValue: selectedValue,
              onSelected: (String newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
              itemBuilder: (context) {
                return popupMenuItems
                    .map((e) => PopupMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList();
              },
            ),
            Text(selectedValue)
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        childrenButtonSize: const Size(70, 70),
        buttonSize: const Size(70, 70),
        childMargin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              child: Icon(Icons.mail),
              backgroundColor: Colors.red,
              label: 'Mail',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => NextPage())));
              }),
          SpeedDialChild(
              child: Icon(Icons.copy),
              backgroundColor: Colors.blue,
              label: 'Copy',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => TestPage())));
              }),
          SpeedDialChild(
              child: Icon(Icons.person_add),
              backgroundColor: Colors.green,
              labelWidget: Column(
                children: const [
                  Text(
                    '編集する',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Edit',
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => TabBarPage())));
              },
              labelStyle: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: ((context) => NextPage())));
      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
