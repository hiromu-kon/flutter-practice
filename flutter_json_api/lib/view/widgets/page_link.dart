import 'package:flutter/material.dart';
import 'package:flutter_json_api/util/util.dart';

class PageLink extends StatelessWidget {
  PageLink({Key? key, required String this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: HexColor(mainColor)),
      ),
    );
  }
}
