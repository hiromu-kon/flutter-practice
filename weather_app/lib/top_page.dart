import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/weather.dart';
import 'package:weather_app/zipcode.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  String address = '-';
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

  List<Weather> dailyWeather = [
    Weather(
      tempMax: 20,
      tempMin: 17,
      time: DateTime(2022, 10, 1),
      rainyPercent: 0,
    ),
    Weather(
      tempMax: 24,
      tempMin: 19,
      time: DateTime(2022, 10, 2),
      rainyPercent: 0,
    ),
    Weather(
      tempMax: 26,
      tempMin: 17,
      time: DateTime(2022, 10, 3),
      rainyPercent: 0,
    ),
    Weather(
      tempMax: 20,
      tempMin: 17,
      time: DateTime(2022, 10, 4),
      rainyPercent: 0,
    ),
    Weather(
      tempMax: 24,
      tempMin: 19,
      time: DateTime(2022, 10, 5),
      rainyPercent: 0,
    ),
    Weather(
      tempMax: 26,
      tempMin: 17,
      time: DateTime(2022, 10, 6),
      rainyPercent: 0,
    ),
    Weather(
      tempMax: 20,
      tempMin: 17,
      time: DateTime(2022, 10, 7),
      rainyPercent: 0,
    ),
    Weather(
      tempMax: 24,
      tempMin: 19,
      time: DateTime(2022, 10, 8),
      rainyPercent: 0,
    ),
    Weather(
      tempMax: 26,
      tempMin: 17,
      time: DateTime(2022, 10, 9),
      rainyPercent: 0,
    ),
    Weather(
      tempMax: 24,
      tempMin: 19,
      time: DateTime(2022, 10, 10),
      rainyPercent: 0,
    ),
    Weather(
      tempMax: 26,
      tempMin: 17,
      time: DateTime(2022, 10, 11),
      rainyPercent: 0,
    ),
  ];

  List<String> weekDay = ['月', '火', '水', '木', '金', '土', '日'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 200,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '郵便番号を入力',
                ),
                onSubmitted: (value) async {
                  print(value);
                  address = await ZipCode.searchAddressFromZipCode(value);

                  setState(() {});
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              address,
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
                          style: const TextStyle(color: Colors.lightBlueAccent),
                        ),
                        const Icon(Icons.wb_sunny_sharp),
                        Text(
                          '${weather.temp}°',
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const Divider(
              height: 0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: dailyWeather.map((weather) {
                      return SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 50,
                                child: Text(
                                    '${weekDay[weather.time!.weekday - 1]}曜日')),
                            Row(
                              children: [
                                const Icon(Icons.wb_sunny_sharp),
                                Text(
                                  '${weather.rainyPercent}%',
                                  style: const TextStyle(
                                      color: Colors.lightBlueAccent),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${weather.tempMax}',
                                      style: const TextStyle(fontSize: 16)),
                                  Text(
                                    '${weather.tempMin}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black.withOpacity(0.4)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
