import 'package:flutter/material.dart';

class LoginModel with ChangeNotifier {
  bool isObscure = false;

  void changePasseordObscure() {
    isObscure = !isObscure;

    notifyListeners();
  }
}
