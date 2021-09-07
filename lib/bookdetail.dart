import 'package:flutter/material.dart';
import 'package:hello_books/actionwidget.dart';
import 'package:hello_books/descriptionwidget.dart';
import 'package:hello_books/informationwidget.dart';
import 'package:hello_books/models/bookmodel.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({Key? key, required this.book}) : super(key: key);
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.volumeInfo.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InformationWidget(
              book: book,
            ),
            ActionsWidget(
              book: book,
            ),
            DescriptionWidget(
              book: book,
            ),
          ],
        ),
      ),
    );
  }
}
