import 'package:flutter/material.dart';
import 'package:flutter_json_api/util/util.dart';
import 'package:flutter_json_api/view/widgets/footer.dart';
import 'package:flutter_json_api/view/widgets/header.dart';
import 'package:flutter_json_api/view/widgets/page_link.dart';
import 'package:flutter_json_api/view/widgets/title_text.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText('ログイン'),
                Text(
                  'メールアドレス',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Gap(8),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  autofocus: true,
                ),
                Gap(30),
                Text(
                  'パスワード',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Gap(8),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                Gap(50),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(HexColor(mainColor)),
                    ),
                    onPressed: () {},
                    child: Text(
                      'ログイン',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Gap(30),
                Center(
                    child: PageLink(
                        text: 'パスワードを忘れた方',
                        onPressed: () => goEditPasswordPage(context))),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
