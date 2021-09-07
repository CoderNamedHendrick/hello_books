import 'package:flutter/material.dart';
import 'package:hello_books/models/bookmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({Key? key, required this.book}) : super(key: key);
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          book.accessInfo.webReaderLink != ''
              ? FloatingActionButton.extended(
                  label: Text("Read"),
                  heroTag: "webReaderLink",
                  onPressed: () => launch(book.accessInfo.webReaderLink),
                )
              : Container(),
          book.saleInfo.saleability == "FOR_SALE"
              ? FloatingActionButton.extended(
                  onPressed: () => launch(book.saleInfo.buyLink),
                  label: Text("Buy"),
                  heroTag: "buy_book",
                )
              : Container(),
        ],
      ),
    );
  }
}
