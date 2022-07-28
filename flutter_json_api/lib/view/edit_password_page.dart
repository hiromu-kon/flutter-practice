import 'package:flutter/material.dart';
import 'package:flutter_json_api/util/util.dart';
import 'package:flutter_json_api/view/widgets/footer.dart';
import 'package:flutter_json_api/view/widgets/header.dart';
import 'package:flutter_json_api/view/widgets/required_label.dart';
import 'package:flutter_json_api/view/widgets/title_text.dart';
import 'package:gap/gap.dart';

class EditPasswordPage extends StatelessWidget {
  const EditPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText('パスワード再発行'),
                      Gap(20),
                      Text(
                        'パスワードの変更のご案内をメールでお送りします。届いたメールのリンクからパスワードを変更してください。',
                        style: TextStyle(fontSize: 16),
                      ),
                      Gap(40),
                      Row(
                        children: [
                          Text(
                            'Eメール',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Gap(6),
                          RequiredLabel(),
                        ],
                      ),
                      Gap(4),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        autofocus: true,
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
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                    contentPadding: EdgeInsets.all(0.0),
                                    titlePadding: EdgeInsets.all(0.0),
                                    title: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      width: MediaQuery.of(context).size.width,
                                      child: Scaffold(
                                          body: Column(
                                        children: [Icon(Icons.abc)],
                                      )),
                                    ));
                              },
                            );
                          },
                          child: Text(
                            '投稿する',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
