import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/addMemo/add_memo_page.dart';
import 'package:flutter_sample_app/presentation/memoList/memo_list_model.dart';
import 'package:flutter_sample_app/utils/dialog_utils.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class MemoListPage extends StatelessWidget {
  const MemoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MemoListModel>(
      create: (_) => MemoListModel(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Memo一覧'),
        ),
        body: Consumer<MemoListModel>(
          builder: (context, model, child) {
            final memos = model.memos;

            if (memos == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                await model.fetchMemos();
              },
              child: ListView.builder(
                itemCount: memos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Slidable(
                    endActionPane:
                        ActionPane(motion: const ScrollMotion(), children: [
                      SlidableAction(
                        onPressed: (BuildContext context) async {},
                        icon: Icons.delete,
                        backgroundColor: Colors.red,
                        label: '削除',
                      ),
                    ]),
                    child: ListTile(
                      onTap: () async {
                        Widget widget = TextField(
                          decoration: const InputDecoration(
                            hintText: 'メモ内容',
                          ),
                          controller: model.contentController,
                          autofocus: true,
                        );

                        // Widget widget = Column(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: const [
                        //     TextField(
                        //       decoration: InputDecoration(
                        //         hintText: 'タイトル',
                        //       ),
                        //       autofocus: true,
                        //     ),
                        //     TextField(
                        //       decoration: InputDecoration(
                        //         hintText: 'メモ内容',
                        //       ),
                        //     ),
                        //   ],
                        // );

                        final isYes = await showWidgetDialog(
                          context,
                          'メモ編集',
                          widget,
                        );

                        if (isYes) {
                          model.contentController.value;
                        }

                        model.contentController.clear();
                      },
                      title: Text(memos[index].content),
                    ),
                  );
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const AddMemoPage()),
                  fullscreenDialog: true,
                ));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
