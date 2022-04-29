import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert_app/alarm.dart';
import 'package:flutter_alert_app/pages/add_edit_alarm_page.dart';
import 'package:flutter_alert_app/sqflite.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Alarm> alarmList = [];

  Future<void> initDb() async {
    await DbProvider.setDb();
    alarmList = await DbProvider.getData();
    setState(() {});
  }

  Future<void> reBuild() async {
    alarmList = await DbProvider.getData();
    alarmList.sort(
      (a, b) => a.alarmTime.compareTo(b.alarmTime),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    initDb();
  }

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
                onTap: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddEditAlarmPage(alarmList)));
                  reBuild();
                },
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
                            onPressed: (context) async {
                              await DbProvider.deleteData(alarm.id);

                              reBuild();
                            },
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
                            onChanged: (newValue) async {
                              alarm.isActive = newValue;
                              await DbProvider.updateData(alarm);
                              reBuild();
                            }),
                        onTap: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddEditAlarmPage(
                                      alarmList,
                                      index: index)));

                          setState(() {});
                        },
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
