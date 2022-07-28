import 'package:flutter/material.dart';

class RequiredLabel extends StatelessWidget {
  const RequiredLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.red,
        ),
        width: 40,
        height: 20,
        child: Center(
          child: Text(
            '必須',
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
