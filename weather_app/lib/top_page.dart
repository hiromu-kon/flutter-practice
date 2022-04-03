import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/weather.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  Weather currentWeather =
      Weather(temp: 15, description: '晴れ', tempMax: 18, tempMin: 14);

  List<Weather> hourlyWeather = [
    Weather(
        temp: 20,
        description: '晴れ',
        time: DateTime(2022, 10, 1, 10),
        rainyPercent: 0),
    Weather(
        temp: 15,
        description: '雨',
        time: DateTime(2022, 10, 1, 11),
        rainyPercent: 90),
    Weather(
        temp: 17,
        description: '曇り',
        time: DateTime(2022, 10, 1, 12),
        rainyPercent: 10),
    Weather(
        temp: 19,
        description: '晴れ',
        time: DateTime(2022, 10, 1, 13),
        rainyPercent: 0),
    Weather(
        temp: 20,
        description: '晴れ',
        time: DateTime(2022, 10, 1, 10),
        rainyPercent: 0),
    Weather(
        temp: 15,
        description: '雨',
        time: DateTime(2022, 10, 1, 11),
        rainyPercent: 90),
    Weather(
        temp: 17,
        description: '曇り',
        time: DateTime(2022, 10, 1, 12),
        rainyPercent: 10),
    Weather(
        temp: 19,
        description: '晴れ',
        time: DateTime(2022, 10, 1, 13),
        rainyPercent: 0),
    Weather(
        temp: 20,
        description: '晴れ',
        time: DateTime(2022, 10, 1, 10),
        rainyPercent: 0),
    Weather(
        temp: 15,
        description: '雨',
        time: DateTime(2022, 10, 1, 11),
        rainyPercent: 90),
    Weather(
        temp: 17,
        description: '曇り',
        time: DateTime(2022, 10, 1, 12),
        rainyPercent: 10),
    Weather(
        temp: 19,
        description: '晴れ',
        time: DateTime(2022, 10, 1, 13),
        rainyPercent: 0)
  ];

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
              '${currentWeather.temp}°',
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
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              height: 0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: hourlyWeather.map((weather) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    child: Column(
                      children: [
                        Text('${DateFormat('H').format(weather.time!)}時'),
                        Text(
                          '${weather.rainyPercent}%',
                          style: TextStyle(color: Colors.lightBlueAccent),
                        ),
                        const Icon(Icons.wb_sunny_sharp),
                        Text(
                          '${weather.temp}°',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
