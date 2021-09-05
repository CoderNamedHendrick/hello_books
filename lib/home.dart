import 'package:flutter/material.dart';
import 'package:hello_books/api.dart';

class BookListing extends StatefulWidget {
  @override
  _BookListingState createState() => _BookListingState();
}

class _BookListingState extends State<BookListing> {
  String booksResponse = '';

  // method to fetch books asynchronously
  fetchBooks() async {
    // making REST API call
    var response = await makeHttpCall();

    // updating booksResponse to fetched remote data
    setState(() {
      booksResponse = response;
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
      body: SingleChildScrollView(
        // ignore: unnecessary_null_comparison
        child: booksResponse != ''
            ? Text("Google Books API response \n $booksResponse")
            : Text("No Response from API"),
      ),
    );
  }
}
