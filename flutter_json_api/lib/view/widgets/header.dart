import 'package:flutter/material.dart';
import 'package:flutter_json_api/util/util.dart';
import 'package:gap/gap.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: TextButton(
        child: Text(
          'Title',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
          ),
        ),
        onPressed: () => goHomePage(context),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => goLoginPage(context),
          child: Text(
            'ログイン',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: HexColor(mainColor),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: HexColor('#E3E3E3'),
            padding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),
            ),
            elevation: 0,
            shadowColor: Colors.white,
          ),
        ),
        Gap(10),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            '会員登録',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: HexColor(mainColor),
            padding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),
            ),
            elevation: 0,
            shadowColor: Colors.white,
          ),
        ),
        Gap(10),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
