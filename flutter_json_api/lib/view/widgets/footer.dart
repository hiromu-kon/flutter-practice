import 'package:flutter/material.dart';
import 'package:flutter_json_api/util/util.dart';
import 'package:gap/gap.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 100,
          color: Colors.black54,
        ),
        Row(
          children: [
            Gap(10),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                '利用規約',
                style: TextStyle(color: HexColor(subTextColor)),
              ),
            ),
            TextButton(
              onPressed: () => goContactNewPage(context),
              child: Text('お問い合せ'),
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(HexColor(subTextColor)),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
            )
          ],
        ),
        Gap(20),
        Row(
          children: [
            Gap(10),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text('個人情報の取り扱い',
                  style: TextStyle(color: HexColor(subTextColor))),
            ),
            Text('ヘルプ', style: TextStyle(color: HexColor(subTextColor)))
          ],
        ),
        Gap(20),
        Row(
          children: [
            Gap(10),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child:
                  Text('会社概要', style: TextStyle(color: HexColor(subTextColor))),
            ),
            Text('お店や××に伝えたい', style: TextStyle(color: HexColor(subTextColor)))
          ],
        ),
        Gap(40),
        Text(
          'copyright ©︎ 2021 株式会社×××× All Rights Reserved',
          style: TextStyle(fontSize: 12),
        ),
        Gap(20)
      ],
    );
  }
}
