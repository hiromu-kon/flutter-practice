import 'package:flutter/material.dart';
import 'package:weather_app/weather.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  Weather currentWeather =
      Weather(temp: 15, description: '晴れ', tempMax: 18, tempMin: 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('大阪市')),
    );
  }
}
