import 'package:flutter/material.dart';
import 'package:hello_books/models/bookmodel.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({Key? key, required this.book}) : super(key: key);
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.volumeInfo.title),
      ),
      body: Center(
        child: Text(book.volumeInfo.description),
      ),
    );
  }
}
