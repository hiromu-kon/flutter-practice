import 'package:flutter/material.dart';
import 'package:flutter_json_api/gen/assets.gen.dart';
import 'package:flutter_json_api/util/util.dart';
import 'package:flutter_json_api/view/widgets/footer.dart';
import 'package:flutter_json_api/view/widgets/page_link.dart';
import 'package:gap/gap.dart';

class TestEditPostPage extends StatelessWidget {
  const TestEditPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   leadingWidth: 110,
      //   leading: TextButton(
      //     child: Text(
      //       'キャンセル',
      //       style: TextStyle(
      //         color: HexColor(mainColor),
      //         fontSize: 14,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Gap(10),
                  Row(children: [
                    PageLink(
                      text: 'キャンセル',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ]),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Assets.icons.noimage.image(),
                  ),
                  SizedBox(height: 14),
                  SizedBox(
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'あなたのおすすめな物、体験などを書いてください。#タグをつけてシェアしよう！',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Gap(14),
                  _buildFormItem('1'),
                  Gap(14),
                  _buildFormItem('2'),
                  Gap(14),
                  _buildFormItem('3'),
                  Gap(14),
                  _buildFormItem('4'),
                  Gap(40),
                  Row(
                    children: [
                      Text(
                        'カテゴリを選択',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  Gap(14),
                  DropdownButtonFormField(
                    hint: Text('選択してください'),
                    items: [
                      DropdownMenuItem(
                        child: Text('Hello'),
                        value: 'Hello',
                      ),
                    ],
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Gap(14),
                  DropdownButtonFormField(
                    hint: Text('選択してください'),
                    items: [
                      DropdownMenuItem(
                        child: Text('Hello'),
                        value: 'Hello',
                      ),
                    ],
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Gap(40),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            HexColor(mainColor)),
                      ),
                      onPressed: () {},
                      child: Text(
                        '投稿する',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Gap(20),
                  Text('××××はおすすめをシェアするサービスです'),
                  Text('ポジティブな内容をシェアしよう'),
                  Gap(30),
                  PageLink(
                    text: 'お店や×××へのクレーム等はこちら',
                    onPressed: () => Navigator.pop(context),
                  ),
                  Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormItem(String index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          index,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        Gap(10),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Assets.icons.noimage.image(height: 120),
        ),
        Gap(10),
        Flexible(
          child: TextFormField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: '${index}写真の説明文(省略可)',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
