import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: CircularMenu(
        backgroundWidget: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Hello Sliver World'),
              actions: [
                IconButton(icon: Icon(Icons.search), onPressed: () {}),
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
