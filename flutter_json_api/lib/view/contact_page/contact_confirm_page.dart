import 'package:flutter/material.dart';
import 'package:flutter_json_api/util/util.dart';
import 'package:flutter_json_api/view/widgets/footer.dart';
import 'package:flutter_json_api/view/widgets/header.dart';
import 'package:flutter_json_api/view/widgets/title_text.dart';
import 'package:gap/gap.dart';

class ContactConfirmPage extends StatelessWidget {
  const ContactConfirmPage({Key? key}) : super(key: key);

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
                TitleText('お問い合わせ確認'),
                Gap(20),
                Text(
                  '名前',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Gap(16),
                Text(
                  'ああああああああああ',
                  style: TextStyle(fontSize: 16),
                ),
                Gap(26),
                Text(
                  'Eメール',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Gap(16),
                Text(
                  '××××××××××××@yahoo.co.jp',
                  style: TextStyle(fontSize: 16),
                ),
                Gap(26),
                Text(
                  'お問い合わせ内容',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Gap(16),
                Text(
                  '××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××',
                  style: TextStyle(fontSize: 16),
                ),
                Gap(40),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(HexColor(mainColor)),
                    ),
                    onPressed: () => goContactFinishPage(context),
                    child: Text(
                      '送信',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Footer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
