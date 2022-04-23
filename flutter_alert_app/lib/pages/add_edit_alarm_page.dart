import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert_app/alarm.dart';
import 'package:intl/intl.dart';

class AddEditAlarmPage extends StatefulWidget {
  List<Alarm> alarmList;

  AddEditAlarmPage(this.alarmList, {Key? key}) : super(key: key);

  @override
  State<AddEditAlarmPage> createState() => _AddEditAlarmPageState();
}

class _AddEditAlarmPageState extends State<AddEditAlarmPage> {
  TextEditingController controller = TextEditingController();
  DateTime selectedDate = DateTime.now();
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
            onTap: () {
              Alarm alarm = Alarm(
                  alarmTime: DateTime(
                      2000, 1, 1, selectedDate.hour, selectedDate.minute));

              widget.alarmList.add(alarm);
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
