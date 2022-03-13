import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/book.dart';
import 'book_list_model.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBookList(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('本一覧'),
        ),
        body: Center(
          child: Consumer<BookListModel>(
            builder: (context, model, child) {
              final List<Book>? books = model.books;

              if (books == null) {
                return const CircularProgressIndicator();
              }

              final List<Widget> widgets = books
                  .map(
                    (book) => ListTile(
                      title: Text(book.title),
                      subtitle: Text(book.author),
                    ),
                  )
                  .toList();

              return ListView(
                children: widgets,
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
