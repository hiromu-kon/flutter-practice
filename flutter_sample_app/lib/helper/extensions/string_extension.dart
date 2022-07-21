extension StringExtension on String? {
  /// null,空文字,半角・全角スペースだけのパターンをチェック
  bool isNotBlank() => this != null && this!.trim().isNotEmpty;

  bool isBlank() => !isNotBlank();

  /// ひらがなをカタカナに変換する
  String hiraToKana(String str) {
    return str.replaceAllMapped(RegExp('[ぁ-ゔ]'),
        (Match m) => String.fromCharCode(m.group(0)!.codeUnitAt(0) + 0x60));
  }
}
