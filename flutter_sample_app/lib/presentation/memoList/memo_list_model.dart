// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_sample_app/entities/memo/memo.dart';
import 'package:flutter_sample_app/repository/memo_repository.dart';

class MemoListModel with ChangeNotifier {
  MemoListModel() {
    _init();
  }

  TextEditingController contentController = TextEditingController();

  final _memoRepo = MemoRepository();

  List<Memo>? memos;

  Future _init() async {
    await fetchMemos();
  }

  Future<void> fetchMemos() async {
    _memoRepo.fetchMemos().listen((event) {
      // final memos = event.docs.map((doc) => Memo.fromDocument(doc)).toList();

      memos = event;

      notifyListeners();
    });
  }

  Future updateMemo() async {}

  // Future<void> fetchMemos() async {
  //   final snapshot = FirebaseFirestore.instance.collection('memos').snapshots();

  //   snapshot.listen((event) {
  //     final memos = event.docs.map((doc) => Memo.fromDocument(doc)).toList();

  //     this.memos = memos;

  //     notifyListeners();
  //   });
  // }
}
