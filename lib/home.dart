import 'package:flutter/material.dart';
import 'package:hello_books/api.dart';
import 'package:hello_books/booktile.dart';

class BookListing extends StatefulWidget {
  @override
  _BookListingState createState() => _BookListingState();
}

class _BookListingState extends State<BookListing> {
  late var booksListing;

  // method to fetch books asynchronously
  fetchBooks() async {
    // making REST API call
    var response = await makeHttpCall();

    // updating booksResponse to fetched remote data
    setState(() {
      booksListing = response["items"];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: booksListing == null ? 0 : booksListing.length,
        itemBuilder: (context, index) {
          // current information passed on to BookTile
          return BookTile(book: booksListing[index]);
        },
      ),
    );
  }
}
