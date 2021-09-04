import 'package:flutter/material.dart';

void main() {
  runApp(HelloBooksApp());
}

class HelloBooksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Hello Books'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> greetings = [
    'Hello Books',
    'Hola Libros',
    'Ciao Libri',
    'ैलो िकताब'
  ];

  bool isLocal = true;
  int index = 0;
  late String current;
  void _updateGreeting() {
    setState(() {
      current = greetings[index];
      index = index == (greetings.length - 1) ? 0 : index + 1;
    });
  }

  List<Color> colors = [Colors.orange, Colors.red, Colors.pink, Colors.blue];

  getColor(int index) {
    return colors[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Table(
        border: TableBorder.all(width: 20),
        columnWidths: {
          0: FractionColumnWidth(.5),
          1: FractionColumnWidth(.5),
        },
        children: [
          TableRow(
            children: [
              childWidget(0),
              childWidget(1),
            ],
          ),
          TableRow(
            children: [
              childWidget(2),
              childWidget(3),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateGreeting,
        tooltip: 'Greeting',
        child: Icon(Icons.insert_emoticon),
      ),
    );
  }

  Widget childWidget(int index) {
    return Container(
      color: getColor(index),
      width: 200 + index * 20.toDouble(),
      height: 200 + index * 30.toDouble(),
      child: Center(
        child: Text(
          '$index',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
