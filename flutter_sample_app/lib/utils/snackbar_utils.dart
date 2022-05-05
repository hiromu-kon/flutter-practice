// Flutter imports:
import 'package:flutter/material.dart';

class SnackBarUtils extends StatelessWidget {
  const SnackBarUtils({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  /// 成功の場合のSnackBar
  static showSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.green,
      content: Row(
        children: [
          const Icon(
            Icons.done,
            color: Colors.white,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(message),
        ],
      ),
      duration: const Duration(milliseconds: 2000),
      behavior: SnackBarBehavior.floating,
    ));
  }

  /// 失敗の場合のSnackBar
  static showError(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Row(
        children: [
          const Icon(
            Icons.error,
            color: Colors.white,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(message),
        ],
      ),
      duration: const Duration(milliseconds: 3000),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
