import 'package:flutter/material.dart';
import 'package:flutter_mvvm_demo/view_mode/list_picture_viewmodel.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListPictureViewModel listPictureViewModel = new ListPictureViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pictures'),
      ),
      body: FutureBuilder(
        future: listPictureViewModel.fetchPictures(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return MasonryGridView.count(
              crossAxisCount: 4,
              itemCount: listPictureViewModel.pictures?.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    // color: Colors.grey,
                    // child: FadeInImage.memoryNetwork(
                    //   placeholder: kTransparentImage,
                    //   image:
                    //       '${listPictureViewModel.pictures![index].picSumModel!.url}',
                    //   fit: BoxFit.cover,
                    //   placeholderErrorBuilder: (c, o, s) {
                    //     return Container();
                    //   },
                    //   imageErrorBuilder: (c, o, s) {
                    //     return Icon(
                    //       Icons.error,
                    //       color: Colors.red,
                    //     );
                    //   },
                    // ),
                    );
              },
            );
          }
        },
      ),
    );
  }
}
