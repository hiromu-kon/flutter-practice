import 'package:flutter/material.dart';
import 'package:flutter_json_api/util/util.dart';
import 'package:flutter_json_api/view/widgets/footer.dart';
import 'package:flutter_json_api/view/widgets/header.dart';
import 'package:gap/gap.dart';

class ContactFinishPage extends StatelessWidget {
  const ContactFinishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: WillPopScope(
        onWillPop: () async => false,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'お問い合わせを',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '送信しました。',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(80),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            HexColor(mainColor)),
                      ),
                      onPressed: () => goHomePage(context),
                      child: Text(
                        'ホームに戻る',
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
            Footer(),
          ],
        ),
      ),
    );
  }
}
