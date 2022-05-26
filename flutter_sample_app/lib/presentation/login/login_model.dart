// Flutter imports:
import 'package:flutter/material.dart';

class LoginModel with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = false;

  void changePasseordObscure() {
    isObscure = !isObscure;

    notifyListeners();
  }
}
