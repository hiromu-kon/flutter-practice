// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:circular_menu/circular_menu.dart';
import 'package:sample/settings_page.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: CircularMenu(
        backgroundWidget: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Hello Sliver World'),
              actions: [
                IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()));
                    }),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 200,
                    color: Colors.red,
                  ),
                  Container(
                    height: 200,
                    color: Colors.green,
                  ),
                  Container(
                    height: 200,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 200,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
        alignment: Alignment.bottomRight,
        items: [
          CircularMenuItem(
            icon: Icons.settings,
            color: Colors.orange,
            onTap: () {},
          ),
          CircularMenuItem(
            icon: Icons.chat,
            color: Colors.purple,
            onTap: () {},
          ),
          CircularMenuItem(
            icon: Icons.notifications,
            color: Colors.brown,
            onTap: () {},
          )
        ],
      ),
    );
  }
}
