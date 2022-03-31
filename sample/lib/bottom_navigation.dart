import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.abc)),
        BottomNavigationBarItem(icon: Icon(Icons.back_hand)),
        BottomNavigationBarItem(icon: Icon(Icons.car_rental))
      ]),
    );
  }
}
