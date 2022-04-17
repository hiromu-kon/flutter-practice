// Flutter imports:

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('タブ画面移動サンプル'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.cloud_outlined)),
              Tab(icon: Icon(Icons.beach_access_sharp)),
              Tab(icon: Icon(Icons.brightness_5_sharp)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            const Center(
                child: LikeButton(
              onTap: onLikeButtonTapped,
            )),
            Center(child: LikeButton(
              likeBuilder: (bool isLiked) {
                return Icon(Icons.home,
                    color: isLiked ? Colors.deepPurpleAccent : Colors.grey);
              },
            )),
            Center(
                child: Column(
              children: [
                ElevatedButton(
                  child: const Text('SnackBar'),
                  onPressed: () {
                    showTopSnackBar(
                      context,
                      CustomSnackBar.success(
                        message:
                            "Good job, your release is successful. Have a nice day",
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text('SnackBar'),
                  onPressed: () {
                    showTopSnackBar(
                      context,
                      const CustomSnackBar.info(
                        message:
                            "There is some information. You need to do something with that",
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text('SnackBar'),
                  onPressed: () {
                    showTopSnackBar(
                      context,
                      CustomSnackBar.error(
                        message:
                            "Something went wrong. Please check your credentials and try again",
                      ),
                    );
                  },
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

Future<bool> onLikeButtonTapped(bool isLiked) async {
  return !isLiked;
}
