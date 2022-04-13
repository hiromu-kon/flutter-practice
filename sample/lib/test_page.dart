// Flutter imports:
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 300,
        leading: TextButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          label: const Text('プロフィール'),
        ),
        elevation: 1,
        title: const Text(
          '設定',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: const Icon(Icons.arrow_forward_ios),
            title: Text(
              menuList[index],
            ),
            onTap: () {},
          );
        },
        itemCount: menuList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }

  final List<String> menuList = [
    '通知',
    'アカウント',
    'プレミアム',
    'Native Home',
    'コイン',
    'ダイヤモンド',
    'ヘルプ',
    'お問い合わせ',
    'その他(利用規約等)'
  ];
}
