// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_sample_app/repository/memo_repository.dart';

class AddMemoModel extends ChangeNotifier {
  TextEditingController contentController = TextEditingController();

  final _memoRepo = MemoRepository();
  late bool result;

  Future<bool> addMemo(content) async {
    return result = await _memoRepo.addMemo(content);
  }
}
