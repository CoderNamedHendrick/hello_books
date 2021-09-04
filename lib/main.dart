import 'package:flutter/material.dart';

void main() {
  runApp(HelloBooksApp());
}

class HelloBooksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello Books'),
        ),
        body: Center(
          child: Text(
            'Hello Books',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Greeting',
          child: Icon(Icons.insert_emoticon),
        ),
      ),
    );
  }
}
