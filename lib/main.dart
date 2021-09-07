import 'package:flutter/material.dart';
import 'package:hello_books/bookdetail.dart';
import 'package:hello_books/home.dart';
import 'package:hello_books/models/bookmodel.dart';
import 'package:hello_books/pagenotfound.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookListing(),
      initialRoute: '/',
      onGenerateRoute: generateRoute,
    );
  }

  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BookListing(),
        );
      case '/details':
        if (args is BookModel) {
          return MaterialPageRoute(
            builder: (context) => BookDetailsPage(
              book: args,
            ),
          );
        }
        return MaterialPageRoute(
          builder: (context) => PageNotFound(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => PageNotFound(),
        );
    }
  }
}
// class BooksApp extends StatefulWidget {
//   @override
//   _BooksAppState createState() => _BooksAppState();
// }

// class _BooksAppState extends State<BooksApp> {
//   AppThemes currentTheme = AppThemes.LIGHT;
//   MyDatabase _database = constructDb();

//   // Fetching theme_id from SharedPreference
//   // void loadActiveTheme(BuildContext context) async {
//   //   var sharedPrefs = await SharedPreferences.getInstance();
//   // if theme_id is null, then set default theme
//   //   int themeId = sharedPrefs.getInt('theme_id') ?? AppThemes.LIGHT.index;
//   //   setState(() {
//   //     currentTheme = AppThemes.values[themeId];
//   //   });
//   // }

//   // Fetching theme_id DB
//   void loadActiveTheme(BuildContext context) async {
//     ThemePref themePref = await _database.getActiveTheme();
//     setState(() {
//       currentTheme = AppThemes.values[themePref.themeId];
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Load theme from sharedPreference
//     loadActiveTheme(context);
//   }

//   // Save theme_id using SharedPreference
//   // Future<void> switchTheme() async {
//   //   currentTheme =
//   //       currentTheme == AppThemes.LIGHT ? AppThemes.DARK : AppThemes.LIGHT;
//   //   save current selection
//   //   var sharedPrefs = await SharedPreferences.getInstance();
//   //   await sharedPrefs.setInt('theme_id', currentTheme.index);
//   // }

//   // Save theme_id in DB
//   Future<void> switchTheme() async {
//     var oldTheme = currentTheme;

//     currentTheme == AppThemes.LIGHT
//         ? currentTheme = AppThemes.DARK
//         : currentTheme = AppThemes.LIGHT;

//     // check if theme_id entry exists in table already
//     var isOldThemeActive = _database.themeIdExists(oldTheme.index);
//     // only active theme id is present in the db.
//     // Remove any existing theme id from DB before adding new entry
//     if (isOldThemeActive != null) {
//       _database.deactivateTheme(oldTheme.index);
//     }
//     setState(() {
//       _database.activateTheme(currentTheme);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: currentTheme == AppThemes.LIGHT ? defaultTheme : darkTheme,
//       home: Scaffold(
//         appBar: AppBar(
//           leading: Icon(Icons.home_filled),
//           title: Text(
//             "Books Listing",
//             style: TextStyle(
//               fontFamily: 'Pangolin',
//               fontSize: 30,
//             ),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 setState(
//                   () {
//                     switchTheme();
//                   },
//                 );
//               },
//               icon: Icon(Icons.all_inclusive),
//             ),
//           ],
//         ),
//         body: BooksListing(),
//       ),
//     );
//   }
// }

// class BooksListing extends StatelessWidget {
//   final booksListing = bookData();
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData(
//         cardColor: Colors.pinkAccent,
//         textTheme: TextTheme(
//           bodyText2: Theme.of(context)
//               .copyWith(
//                 textTheme: TextTheme(
//                   bodyText2: TextStyle(fontStyle: FontStyle.italic),
//                 ),
//               )
//               .textTheme
//               .bodyText2,
//           headline6: TextStyle(
//             fontFamily: 'Pangolin',
//             fontSize: 20,
//           ),
//         ),
//       ),
//       child: ListView.builder(
//         itemCount: booksListing.length,
//         itemBuilder: (context, index) {
//           return Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             elevation: 5,
//             margin: EdgeInsets.all(10),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Flexible(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '${booksListing[index]['title']}',
//                           style: Theme.of(context).textTheme.headline6,
//                         ),
//                         booksListing[index]['authors'] != null
//                             ? Text(
//                                 'Author(s): ${booksListing[index]['authors'].join(", ")}',
//                                 style: Theme.of(context).textTheme.bodyText2,
//                               )
//                             : Text(""),
//                       ],
//                     ),
//                   ),
//                   Image.asset(
//                     booksListing[index]['image'],
//                     fit: BoxFit.fill,
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// List bookData() {
//   return [
//     {
//       'title': 'Book Title',
//       'authors': ['Author1', 'Author2'],
//       'image': 'assets/book_cover.png',
//     },
//     {
//       'title': 'Book Title 2',
//       'authors': ['Author1'],
//       'image': 'assets/book_cover.png',
//     }
//   ];
// }
