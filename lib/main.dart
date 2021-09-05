import 'package:flutter/material.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatelessWidget {
  final ThemeData defaultTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    accentColor: Colors.lightBlueAccent,
    appBarTheme: AppBarTheme(
      color: Colors.blue,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );

  final ThemeData pinkTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.pink,
    accentColor: Colors.pinkAccent,
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.orange,
    accentColor: Colors.yellowAccent,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Books Listing"),
        ),
        body: BooksListing(),
      ),
    );
  }
}

class BooksListing extends StatelessWidget {
  final booksListing = bookData();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: booksListing.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
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
                        '${booksListing[index]['title']}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      booksListing[index]['authors'] != null
                          ? Text(
                              'Author(s): ${booksListing[index]['authors'].join(", ")}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )
                          : Text(""),
                    ],
                  ),
                ),
                Image.asset(
                  booksListing[index]['image'],
                  fit: BoxFit.fill,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

List bookData() {
  return [
    {
      'title': 'Book Title',
      'authors': ['Author1', 'Author2'],
      'image': 'assets/book_cover.png',
    },
    {
      'title': 'Book Title 2',
      'authors': ['Author1'],
      'image': 'assets/book_cover.png',
    }
  ];
}
