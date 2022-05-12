// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:flutter_sample_app/domain/user.dart';
import 'package:flutter_sample_app/repository/user_repository.dart';

class UserListModel extends ChangeNotifier {
  UserListModel() {
    _init();
  }

  final _userRepo = UserRepository();

  List<User>? users;

  Future _init() async {
    await fetchUsers();
    notifyListeners();
  }

  Future<void> fetchUsers() async {
    users = await _userRepo.fetchUsers();
  }
}
