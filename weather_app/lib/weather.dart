import 'dart:convert';
import 'package:http/http.dart';

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

  static Future<Weather?> getCurrentWeather(String zipCode) async {
    String _zipCode;
    const API_KEY = String.fromEnvironment('API_KEY');

    if (zipCode.contains('_')) {
      _zipCode = zipCode;
    } else {
      _zipCode = zipCode.substring(0, 3) + '-' + zipCode.substring(3);
    }
    String url =
        'https://api.openweathermap.org/data/2.5/weather?zip=$_zipCode,JP&appid=${API_KEY}&lang=ja&units=metric';

    try {
      var result = await get(Uri.parse(url));

      Map<String, dynamic> data = jsonDecode(result.body);

      Weather currentWeather = Weather(
          description: data['weather']['description'],
          temp: data['main']['temp'],
          tempMax: data['main']['temp_max'],
          tempMin: data['main']['temp_min']);

      return currentWeather;
    } catch (e) {
      return null;
    }
  }
}
