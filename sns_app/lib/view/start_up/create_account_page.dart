import 'package:flutter/material.dart';

class CreateAccuntPage extends StatefulWidget {
  const CreateAccuntPage({Key? key}) : super(key: key);

  @override
  State<CreateAccuntPage> createState() => _CreateAccuntPageState();
}

class _CreateAccuntPageState extends State<CreateAccuntPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController selfIntroductionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          '新規登録',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 40,
                child: Icon(Icons.add),
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: '名前'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: 300,
                  child: TextField(
                    controller: userIdController,
                    decoration: InputDecoration(hintText: 'ユーザーID'),
                  ),
                ),
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: selfIntroductionController,
                  decoration: InputDecoration(hintText: '自己紹介'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: 'メールアドレス'),
                  ),
                ),
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: passController,
                  decoration: InputDecoration(hintText: 'パスワード'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        userIdController.text.isNotEmpty &&
                        selfIntroductionController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        passController.text.isNotEmpty) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text('アカウントを作成'))
            ],
          ),
        ),
      ),
    );
  }
}
