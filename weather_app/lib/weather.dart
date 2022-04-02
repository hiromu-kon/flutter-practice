class Weather {
  int? temp; //気温
  int? tempMax; //最高気温
  int? tempMin; //最低気温
  String? description; //天気状態
  double? lon; //経度
  double? lat; //緯度
  String? icon; //天気情報のアイコン画像
  DateTime? time; //日時
  int? rainyPercent; //降水確率

  Weather({
    this.temp,
    this.tempMax,
    this.tempMin,
    this.description,
    this.lon,
    this.lat,
    this.icon,
    this.time,
    this.rainyPercent,
  });
}
