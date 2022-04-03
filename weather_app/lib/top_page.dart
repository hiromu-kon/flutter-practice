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
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              '大阪市',
              style: TextStyle(fontSize: 25),
            ),
            Text(currentWeather.description!),
            Text(
              '${currentWeather.temp}',
              style: const TextStyle(fontSize: 80),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text('最高:${currentWeather.tempMax}°'),
                ),
                Text('最低:${currentWeather.tempMin}°'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
