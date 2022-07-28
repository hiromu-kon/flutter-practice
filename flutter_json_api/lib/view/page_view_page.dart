import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PageViewPage extends HookConsumerWidget {
  const PageViewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _pageController = usePageController(initialPage: 2);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page View'),
        actions: [
          IconButton(
              onPressed: () => _pageController.previousPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
              icon: Icon(Icons.keyboard_arrow_left)),
          IconButton(
              onPressed: () => _pageController.nextPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
              icon: Icon(Icons.keyboard_arrow_right)),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _buildPageView(),
      ),
    );
  }
}

// class PageViewPage extends StatefulHookConsumerWidget {
//   const PageViewPage({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _PageViewPageState();
// }

// class _PageViewPageState extends ConsumerState<PageViewPage> {
//   final _pageController = PageController(initialPage: 1);

//   @override
//   void dispose() {
//     super.dispose();
//     _pageController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Page View'),
//         actions: [
//           IconButton(
//               onPressed: () => _pageController.previousPage(
//                     duration: const Duration(seconds: 1),
//                     curve: Curves.easeInOut,
//                   ),
//               icon: Icon(Icons.keyboard_arrow_left)),
//           IconButton(
//               onPressed: () => _pageController.nextPage(
//                     duration: const Duration(seconds: 1),
//                     curve: Curves.easeInOut,
//                   ),
//               icon: Icon(Icons.keyboard_arrow_right)),
//         ],
//       ),
//       body: PageView(
//         // physics: const NeverScrollableScrollPhysics(),
//         // scrollDirection: Axis.vertical,
//         controller: _pageController,
//         children: _buildPageView(),
//       ),
//     );
//   }
// }

List<Widget> _buildPageView() {
  return [
    Container(
      color: Colors.red,
      child: const Center(
        child: Text('Page 1'),
      ),
    ),
    Container(
      color: Colors.indigo,
      child: const Center(
        child: Text('Page 2'),
      ),
    ),
    Container(
      color: Colors.green,
      child: const Center(
        child: Text('Page 3'),
      ),
    ),
  ];
}
