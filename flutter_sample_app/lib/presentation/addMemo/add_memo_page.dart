// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:flutter_sample_app/presentation/addMemo/add_memo_model.dart';

class AddMemoPage extends StatelessWidget {
  const AddMemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Memo追加'),
        ),
        body: ChangeNotifierProvider(
          create: (_) => AddMemoModel(),
          child: Consumer<AddMemoModel>(
            builder: (context, model, child) {
              return Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: model.contentController,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        print(model.contentController.text);

                        if (model.contentController.text.isNotEmpty) {
                          var result =
                              await model.addMemo(model.contentController.text);

                          if (result) {
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: const Text('追加'),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
