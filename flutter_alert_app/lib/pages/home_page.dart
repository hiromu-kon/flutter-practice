import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert_app/alarm.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Alarm> alarmList = [
    Alarm(alarmTime: DateTime.now()),
    Alarm(alarmTime: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              backgroundColor: Colors.black,
              largeTitle: const Text(
                'アラーム',
                style: TextStyle(color: Colors.white),
              ),
              trailing: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.add,
                  color: Colors.orange,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                Alarm alarm = alarmList[index];

                return Column(
                  children: [
                    if (index == 0)
                      const Divider(color: Colors.grey, height: 1),
                    Slidable(
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: null,
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(
                          DateFormat('H:mm').format(alarm.alarmTime),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 50),
                        ),
                        trailing: CupertinoSwitch(
                            value: alarm.isActive,
                            onChanged: (newValue) {
                              setState(() {
                                alarm.isActive = newValue;
                              });
                            }),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 0,
                    )
                  ],
                );
              }, childCount: alarmList.length),
            )
          ],
        ));
  }
}
