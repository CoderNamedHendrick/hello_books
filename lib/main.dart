import 'package:flutter/material.dart';
import 'package:hello_books/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(BooksApp());
}

enum AppThemes { LIGHT, DARK }

class BooksApp extends StatefulWidget {
  @override
  _BooksAppState createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  AppThemes currentTheme = AppThemes.LIGHT;

  // Fetching theme_id from SharedPreference
  void loadActiveTheme(BuildContext context) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    // if theme_id is null, then set default theme
    int themeId = sharedPrefs.getInt('theme_id') ?? AppThemes.LIGHT.index;

    setState(() {
      currentTheme = AppThemes.values[themeId];
    });
  }

  @override
  void initState() {
    super.initState();
    // Load theme from sharedPreference
    loadActiveTheme(context);
  }

  // Save theme_id using SharedPreference
  Future<void> switchTheme() async {
    currentTheme =
        currentTheme == AppThemes.LIGHT ? AppThemes.DARK : AppThemes.LIGHT;

    // save current selection
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setInt('theme_id', currentTheme.index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme == AppThemes.LIGHT ? defaultTheme : darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Books Listing",
            style: TextStyle(
              fontFamily: 'Pangolin',
              fontSize: 30,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(
                  () {
                    switchTheme();
                  },
                );
              },
              icon: Icon(Icons.all_inclusive),
            ),
          ],
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
    return Theme(
      data: ThemeData(
        cardColor: Colors.pinkAccent,
        textTheme: TextTheme(
          bodyText2: Theme.of(context)
              .copyWith(
                textTheme: TextTheme(
                  bodyText2: TextStyle(fontStyle: FontStyle.italic),
                ),
              )
              .textTheme
              .bodyText2,
          headline6: TextStyle(
            fontFamily: 'Pangolin',
            fontSize: 20,
          ),
        ),
      ),
      child: ListView.builder(
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
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        booksListing[index]['authors'] != null
                            ? Text(
                                'Author(s): ${booksListing[index]['authors'].join(", ")}',
                                style: Theme.of(context).textTheme.bodyText2,
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
      ),
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
