import 'package:flutter/material.dart';
import 'package:hello_books/api.dart';
import 'package:hello_books/booktile.dart';
import 'package:hello_books/models/bookmodel.dart';

class BookListing extends StatefulWidget {
  @override
  _BookListingState createState() => _BookListingState();
}

class _BookListingState extends State<BookListing> {
  List<BookModel> booksListing = [];

  // method to fetch books asynchronously
  fetchBooks() async {
    // making REST API call
    var response = await makeHttpCall();
    setState(() {
      booksListing = response;
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
      appBar: AppBar(
        title: Text('Book Listings'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: booksListing.isEmpty ? 0 : booksListing.length,
        itemBuilder: (context, index) {
          // Passing bookModel obj to BookTile widget
          return BookTile(bookModelObj: booksListing[index]);
        },
      ),
    );
  }
}
