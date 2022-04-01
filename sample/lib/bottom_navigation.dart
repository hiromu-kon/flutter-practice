import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('ABC'),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.abc),
          label: 'ABC',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.back_hand), label: 'HAND'),
        BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'CAR')
      ]),
    );
  }
}
