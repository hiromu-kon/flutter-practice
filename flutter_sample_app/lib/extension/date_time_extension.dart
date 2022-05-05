extension DateTimeExtension on DateTime {
  /// 呼び出し元を起点に月初日付を返す
  ///
  /// [addMonth]=1なら翌月、-1なら前月
  DateTime firstDayOfMonth({int addMonth = 0}) =>
      DateTime(year, month + addMonth, 1);

  /// 呼び出し元を起点に月末日付を返す
  ///
  /// [addMonth]=1なら翌月、-1なら前月
  DateTime lastDayOfMonth({int addMonth = 0}) =>
      // 指定月の翌月1日の1日前を取得
      DateTime(year, month + addMonth, 1).add(const Duration(days: -1));
}
