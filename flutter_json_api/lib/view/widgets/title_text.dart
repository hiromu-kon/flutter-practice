import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class TitleText extends StatelessWidget {
  TitleText(this.text);

  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(30),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Gap(30),
      ],
    );
  }
}
