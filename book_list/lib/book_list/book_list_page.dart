import 'package:book_list/add_book/add_book_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../domain/book.dart';
import '../edit_book/edit_book_page.dart';
import 'book_list_model.dart';

class BookListPage extends StatelessWidget {
  BookListPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBookList(),
      child: ScaffoldMessenger(
        key: _scaffoldKey,
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
                      (book) => Slidable(
                        child: ListTile(
                          title: Text(book.title),
                          subtitle: Text(book.author),
                        ),
                        endActionPane: ActionPane(
                          children: [
                            SlidableAction(
                              onPressed: (context) async {
                                final String? title = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditBookPage(book),
                                  ),
                                );

                                if (title != null) {
                                  final snackBar = SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text('$titleを編集しました'),
                                  );
                                  _scaffoldKey.currentState
                                      ?.showSnackBar(snackBar);
                                }

                                model.fetchBookList();
                              },
                              backgroundColor: Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: '編集',
                            ),
                            SlidableAction(
                              onPressed: (context) async {
                                await showConfirmDialog(
                                    context, book, model, _scaffoldKey);
                              },
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: '削除',
                            ),
                          ],
                          motion: ScrollMotion(),
                        ),
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
            onPressed: () async {
              final bool? added = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddBookPage(),
                  fullscreenDialog: true,
                ),
              );

              if (added != null && added) {
                final snackBar = SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('本を追加しました'),
                );
                _scaffoldKey.currentState?.showSnackBar(snackBar);
              }
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

Future showConfirmDialog(
    BuildContext context, Book book, BookListModel model, _scaffoldKey) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        title: Text('削除の確認'),
        content: Text("『${book.title}』を削除しますか？"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('いいえ'),
          ),
          TextButton(
            onPressed: () async {
              await model.deleteBook(book);

              Navigator.pop(context);

              final snackBar = SnackBar(
                backgroundColor: Colors.red,
                content: Text("${book.title}を削除しました"),
              );
              _scaffoldKey.currentState?.showSnackBar(snackBar);
            },
            child: Text('はい'),
          )
        ],
      );
    },
  );
}
