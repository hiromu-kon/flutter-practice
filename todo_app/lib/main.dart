import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> todoList = [];

  String content = "";

  // TextEditingController _todoInputController;
  //
  // void initState() {
  //   super.initState();
  //   _todoInputController = TextEditingController();
  // }
  //
  // void dispose() {
  //   super.dispose();
  //   _todoInputController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          title: const Text("Todo App"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: const InputDecoration(hintText: '入力してください'),
                onChanged: (value) {
                  content = value;
                },
                autofocus: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, right: 0.0, bottom: 30.0, left: 0.0),
              child: RaisedButton(
                color: Colors.teal[400],
                textColor: Colors.white,
                child: const Text("保存"),
                onPressed: () {
                  setState(() {
                    if (content.isNotEmpty) {
                      todoList.add(content);
                    }
                  });
                },
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.only(
                          top: 0.0,
                          right: 0.0,
                          bottom: 0.0,
                          left: 0.0,
                        ),
                        margin: const EdgeInsets.only(
                          top: 1.0,
                          right: 0.0,
                          bottom: 0.0,
                          left: 0.0,
                        ),
                        color: Colors.cyan[600],
                        child: ListTile(
                          leading: const Icon(Icons.star),
                          title: Text(
                            ("$index : ${todoList[index]}"),
                            style: const TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ));
  }
}
