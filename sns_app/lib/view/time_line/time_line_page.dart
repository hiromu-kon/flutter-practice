import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sns_app/model/account.dart';
import 'package:sns_app/model/post.dart';
import 'package:sns_app/view/time_line/post_page.dart';

class TimeLinePage extends StatefulWidget {
  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  Account myAccount = Account(
    id: '1',
    name: 'Flutter User',
    userId: '@flutter_id',
    imagePath:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeAx_d6XyicREzk1ykPoT1-vD6yKH9oTaO0w&usqp=CAU',
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
  );

  List<Post> postList = [
    Post(
      id: '1',
      content: '初めまして',
      postAccountId: '1',
      createdTime: DateTime.now(),
    ),
    Post(
      id: '2',
      content: '初めまして2回',
      postAccountId: '1',
      createdTime: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'タイムライン',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: postList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: index == 0
                  ? Border(
                      top: BorderSide(color: Colors.grey, width: 0),
                      bottom: BorderSide(color: Colors.grey, width: 0),
                    )
                  : Border(
                      bottom: BorderSide(color: Colors.grey, width: 0),
                    ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  foregroundImage: NetworkImage(myAccount.imagePath),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  myAccount.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  myAccount.userId,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              DateFormat('M/d/yy').format(
                                postList[index].createdTime!,
                              ),
                            )
                          ],
                        ),
                        Text(postList[index].content)
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PostPage()));
        },
        child: Icon(Icons.chat_bubble_outline),
      ),
    );
  }
}
