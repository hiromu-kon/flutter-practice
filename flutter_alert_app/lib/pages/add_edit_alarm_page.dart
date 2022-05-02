import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert_app/alarm.dart';
import 'package:flutter_alert_app/sqflite.dart';
import 'package:intl/intl.dart';

class AddEditAlarmPage extends StatefulWidget {
  List<Alarm> alarmList;

  final int? index;

  AddEditAlarmPage(this.alarmList, {Key? key, this.index}) : super(key: key);

  @override
  State<AddEditAlarmPage> createState() => _AddEditAlarmPageState();
}

class _AddEditAlarmPageState extends State<AddEditAlarmPage> {
  TextEditingController controller = TextEditingController();
  DateTime selectedDate = DateTime.now();

  void initEditalarm() {
    if (widget.index != null) {
      selectedDate = widget.alarmList[widget.index!].alarmTime;
      controller.text = DateFormat('H:mm').format(selectedDate);

      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    initEditalarm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: GestureDetector(
          child: Container(
              alignment: Alignment.center,
              child: const Text(
                'キャンセル',
                style: TextStyle(color: Colors.orange),
              )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black87,
        title: const Text(
          'アラーム',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 20),
              child: const Text(
                '保存',
                style: TextStyle(color: Colors.orange),
              ),
            ),
            onTap: () async {
              Alarm alarm = Alarm(
                  alarmTime: DateTime(
                      2000, 1, 1, selectedDate.hour, selectedDate.minute));

              if (widget.index != null) {
                alarm.id = widget.alarmList[widget.index!].id;
                await DbProvider.updateData(alarm);
              } else {
                await DbProvider.insertData(alarm);
              }
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '時間',
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: controller,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      readOnly: true,
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return CupertinoDatePicker(
                                initialDateTime: selectedDate,
                                mode: CupertinoDatePickerMode.time,
                                onDateTimeChanged: (newDate) {
                                  String time =
                                      DateFormat('H:mm').format(newDate);

                                  selectedDate = newDate;
                                  setState(() {
                                    controller.text = time;
                                  });
                                },
                              );
                            });
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
