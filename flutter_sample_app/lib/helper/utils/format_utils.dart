// Package imports:
import 'package:intl/intl.dart';

class FormatUtils {
  FormatUtils._();

  static String divideByComma(int number) {
    final formatter = NumberFormat("#,###");
    return formatter.format(number);
  }
}
