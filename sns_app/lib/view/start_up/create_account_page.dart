// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:sns_app/model/account.dart';
import 'package:sns_app/utils/authentication.dart';
import 'package:sns_app/utils/firestore/users.dart';
import 'package:sns_app/utils/function_utils.dart';
import 'package:sns_app/utils/widget_utils.dart';

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

  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils.createAppBar('新規登録'),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  var result = await FunctionUtils.getImageFromGallery();

                  if (result != null) {
                    setState(() {
                      image = File(result.path);
                    });
                  }
                },
                child: CircleAvatar(
                  foregroundImage: image == null ? null : FileImage(image!),
                  radius: 40,
                  child: const Icon(Icons.add),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: '名前'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: userIdController,
                    decoration: const InputDecoration(hintText: 'ユーザーID'),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: selfIntroductionController,
                  decoration: const InputDecoration(hintText: '自己紹介'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: 'メールアドレス'),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: passController,
                  decoration: const InputDecoration(hintText: 'パスワード'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.isNotEmpty &&
                        userIdController.text.isNotEmpty &&
                        selfIntroductionController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        passController.text.isNotEmpty &&
                        image != null) {
                      var result = await Authentication.signUp(
                          email: emailController.text,
                          pass: passController.text);

                      if (result is UserCredential) {
                        String imagePath = await FunctionUtils.uploadImage(
                            result.user!.uid, image!);
                        Account newAccount = Account(
                            id: result.user!.uid,
                            name: nameController.text,
                            userId: userIdController.text,
                            selfIntroduction: selfIntroductionController.text,
                            imagePath: imagePath);

                        var _result = await UserFirestore.setUser(newAccount);

                        if (_result == true) {
                          Navigator.pop(context);
                        }
                      }
                    }
                  },
                  child: const Text('アカウントを作成'))
            ],
          ),
        ),
      ),
    );
  }
}
