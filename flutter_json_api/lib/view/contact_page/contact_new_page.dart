import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_json_api/util/util.dart';
import 'package:flutter_json_api/view/widgets/footer.dart';
import 'package:flutter_json_api/view/widgets/header.dart';
import 'package:flutter_json_api/view/widgets/required_label.dart';
import 'package:flutter_json_api/view/widgets/title_text.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContactNewPage extends HookConsumerWidget {
  const ContactNewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final contentController = useTextEditingController();
    final isPrivacyCheck = useState(false);

    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText('お問い合わせ'),
                Text(
                  'ご質問、ご相談は以下のフォームよりお送りください。',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Gap(30),
                Row(
                  children: [
                    Text(
                      'お名前',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Gap(6),
                    RequiredLabel(),
                  ],
                ),
                Gap(10),
                Text(
                  '非会員の方は氏名をご入力ください。会員の方はニックネームのみで、氏名の入力は必要ありません。',
                  style: TextStyle(fontSize: 16),
                ),
                Gap(10),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  autofocus: true,
                ),
                Gap(24),
                Row(
                  children: [
                    Text(
                      'Eメール',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Gap(6),
                    RequiredLabel(),
                  ],
                ),
                Gap(10),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  autofocus: true,
                ),
                Gap(24),
                Row(
                  children: [
                    Text(
                      'お問い合わせ内容',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Gap(6),
                    RequiredLabel(),
                  ],
                ),
                Gap(10),
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
                Gap(16),
                TextFormField(
                  controller: contentController,
                  maxLines: 6,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  autofocus: true,
                ),
                Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isPrivacyCheck.value,
                      onChanged: (bool? value) {
                        if (value != null) isPrivacyCheck.value = value;
                      },
                      activeColor: HexColor(mainColor),
                    ),
                    TextButton(
                      child: Text('個人情報の取り扱い'),
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            HexColor(mainColor)),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                    ),
                    Text('に同意します')
                  ],
                ),
                Gap(20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(HexColor(mainColor)),
                    ),
                    onPressed: () {
                      print(nameController.text);
                      print(emailController.text);
                      print(contentController.text);
                      goContactConfirmPage(context);
                    },
                    child: Text(
                      '確認へ',
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
