import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  const BookTile({Key? key, required this.book}) : super(key: key);
  final book;

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
                    '${book['volumeInfo']['title']}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  book['volumeInfo']['authors'] != null
                      ? Text(
                          'Author(s): ${book['volumeInfo']['authors'].join(", ")}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      : Text(""),
                ],
              ),
            ),
            book['volumeInfo']['imageLinks']['thumbnail'] != null
                ? Image.network(
                    book['volumeInfo']['imageLinks']['thumbnail'],
                    fit: BoxFit.fill,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
