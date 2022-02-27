import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return const ChatScreen();
            }));
          },
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 8.0,
          ),
          leading: ClipOval(
            child: Image.asset(
              'assets/img/cat.jpg',
              width: 60,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          trailing: const Text('3分前'),
          title: const Text('Mentaくん'),
          subtitle: const Text('Flutter面白い'),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 8.0,
          ),
          leading: ClipOval(
            child: Image.asset(
              'assets/img/dog.jpg',
              width: 60,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          trailing: const Text('3分前'),
          title: const Text('Menteeくん'),
          subtitle: const Text('どうやって勉強しよう？'),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 8.0,
          ),
          leading: ClipOval(
            child: Image.asset(
              'assets/img/cat.jpg',
              width: 60,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          trailing: const Text('3分前'),
          title: const Text('Mentaくん'),
          subtitle: const Text('Flutter面白い'),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 8.0,
          ),
          leading: ClipOval(
            child: Image.asset(
              'assets/img/dog.jpg',
              width: 60,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          trailing: const Text('3分前'),
          title: const Text('Menteeくん'),
          subtitle: const Text('どうやって勉強しよう？'),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 8.0,
          ),
          leading: ClipOval(
            child: Image.asset(
              'assets/img/cat.jpg',
              width: 60,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          trailing: const Text('3分前'),
          title: const Text('Mentaくん'),
          subtitle: const Text('Flutter面白い'),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 8.0,
          ),
          leading: ClipOval(
            child: Image.asset(
              'assets/img/dog.jpg',
              width: 60,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          trailing: const Text('3分前'),
          title: const Text('Menteeくん'),
          subtitle: const Text('どうやって勉強しよう？'),
        ),
      ],
    );
  }
}
