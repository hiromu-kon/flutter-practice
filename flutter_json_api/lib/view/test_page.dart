import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Container(
                    height: 200,
                    color: Colors.redAccent,
                  ),
                ),
                const TabSectionWidget()
              ];
            },
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 800,
                        color: Colors.green,
                      ),
                      Container(
                        height: 800,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 800,
                        color: Colors.blueGrey,
                      ),
                      Container(
                        height: 800,
                        color: Colors.purple,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 800,
                        color: Colors.pink,
                      ),
                      Container(
                        height: 800,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 800,
                        color: Colors.yellow,
                      ),
                      Container(
                        height: 800,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class TabSectionWidget extends StatelessWidget {
  const TabSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: _StickyTabBarDelegate(
        tabBar: TabBar(
          labelColor: Colors.black,
          isScrollable: true,
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal,
          ),
          tabs: [
            SizedBox(
              width: 120,
              child: Tab(
                text: 'スレッド',
              ),
            ),
            SizedBox(
              width: 120,
              child: Tab(
                text: 'コメント',
              ),
            ),
            SizedBox(
              width: 120,
              child: Tab(
                text: 'いいねしたスレッド',
              ),
            ),
            SizedBox(
              width: 120,
              child: Tab(
                text: 'いいねしたコメント',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate({required this.tabBar});

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(),
      ),
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
