import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice/entities/post/post.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController contentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '新規投稿',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: contentController,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (contentController.text.isNotEmpty) {
                    // Post newPost = Post(
                    //   content: contentController.text,
                    //   postAccountId: Authentication.myAccount!.id,
                    // );

                    // var result = await PostFireStore.addPost(newPost);

                    // if (result) {
                    //   Navigator.pop(context);
                    // }
                  }
                },
                child: const Text('投稿'))
          ],
        ),
      ),
    );
  }
}
