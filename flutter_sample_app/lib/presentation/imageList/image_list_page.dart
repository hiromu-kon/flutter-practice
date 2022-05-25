// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_sample_app/gen/assets.gen.dart';

class ImageListPage extends StatelessWidget {
  const ImageListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imageリスト'),
      ),
      body: Column(
        children: [
          Assets.avatar.image(
            width: 150,
          ),
        ],
      ),
    );
  }
}
