import 'package:flutter/material.dart';
import 'package:hello_books/models/bookmodel.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({Key? key, required this.book}) : super(key: key);
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Book Title
              book.volumeInfo.title != ''
                  ? Text(
                      '${book.volumeInfo.title}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Container(),
              //Book Subtitle
              book.volumeInfo.subtitle != ''
                  ? Text(
                      '${book.volumeInfo.subtitle}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Container(),
              //Author(s)
              // ignore: unnecessary_null_comparison
              book.volumeInfo.authors != null
                  ? Text(
                      'Author(s): ${book.volumeInfo.authors.join(", ")}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Container(),
              //Publisher
              book.volumeInfo.publisher != ''
                  ? Text(
                      "Published by: ${book.volumeInfo.publisher}",
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  : Container(),
              //PublishedDate
              book.volumeInfo.publishedDate != ''
                  ? Text(
                      "Published on: ${book.volumeInfo.publishedDate}",
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        // Displaying cover image
        book.volumeInfo.imageLinks.thumbnail != ''
            ? Image.network(
                book.volumeInfo.imageLinks.thumbnail,
                fit: BoxFit.fill,
              )
            : Container(),
      ],
    );
  }
}
