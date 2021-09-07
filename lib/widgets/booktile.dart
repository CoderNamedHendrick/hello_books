import 'package:flutter/material.dart';
import 'package:hello_books/models/bookmodel.dart';

class BookTile extends StatelessWidget {
  const BookTile({Key? key, required this.bookModelObj}) : super(key: key);
  final BookModel bookModelObj;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${bookModelObj.volumeInfo.title}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // ignore: unnecessary_null_comparison
                  bookModelObj.volumeInfo.authors != null
                      ? Text(
                          'Author(s): ${bookModelObj.volumeInfo.authors.join(", ")}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      : Text(""),
                ],
              ),
            ),
            // ignore: unnecessary_null_comparison
            bookModelObj.volumeInfo.imageLinks.thumbnail != null
                ? Image.network(
                    bookModelObj.volumeInfo.imageLinks.thumbnail,
                    fit: BoxFit.fill,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
