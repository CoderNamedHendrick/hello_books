import 'package:flutter/material.dart';
import 'package:hello_books/models/bookmodel.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({Key? key, required this.book}) : super(key: key);
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return book.volumeInfo.description != ''
        ? Text(book.volumeInfo.description.toString())
        : Container();
  }
}
