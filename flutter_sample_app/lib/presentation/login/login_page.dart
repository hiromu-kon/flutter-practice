import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/login/login_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => LoginModel(),
        child: Consumer<LoginModel>(
          builder: (context, model, child) {
            final isObscure = model.isObscure;

            return Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 150, bottom: 30),
                      child: Text(
                        'ログインページ',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                        width: 350,
                        height: 100,
                        child: TextFormField(
                          controller: model.nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '名前',
                          ),
                        )),
                    SizedBox(
                        width: 350,
                        height: 100,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'テキストを入力してください';
                            }

                            return null;
                          },
                          controller: model.emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'メールアドレス',
                          ),
                        )),
                    SizedBox(
                        width: 350,
                        height: 100,
                        child: TextFormField(
                          controller: model.passwordController,
                          obscureText: isObscure,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'パスワード',
                            suffixIcon: IconButton(
                              icon: Icon(isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                model.changePasseordObscure();
                              },
                            ),
                          ),
                        )),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Text('ログイン'),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
