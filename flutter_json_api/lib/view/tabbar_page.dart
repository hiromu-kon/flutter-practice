import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabBarPage extends HookConsumerWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> tabList = [
      Tab(
        icon: Icon(
          Icons.cloud_outlined,
          color: Colors.black,
        ),
        text: 'Hello World!',
      ),
      Tab(
        icon: Icon(
          Icons.beach_access_sharp,
          color: Colors.black,
        ),
        text: 'Hello World!',
      ),
      Tab(
        icon: Icon(
          Icons.brightness_5_sharp,
          color: Colors.black,
        ),
        text: 'Hello World!',
      ),
      Tab(
        icon: Icon(
          Icons.brightness_5_sharp,
          color: Colors.black,
        ),
        text: 'Hello World!',
      ),
    ];

    final _tabController = useTabController(initialLength: tabList.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Sample'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: tabList,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(child: Text('くもり', style: TextStyle(fontSize: 50))),
          Center(child: Text('雨', style: TextStyle(fontSize: 50))),
          Center(child: Text('晴れ', style: TextStyle(fontSize: 50))),
          Center(child: Text('晴れ', style: TextStyle(fontSize: 50))),
        ],
      ),
    );
  }
}
