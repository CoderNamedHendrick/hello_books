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

  int index = 0;
  late String current;
  void _updateGreeting() {
    setState(() {
      current = greetings[index];
      index = index == (greetings.length - 1) ? 0 : index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(widget.title),
    //   ),
    //   body: Center(
    //     child: Text(
    //       greetings[index],
    //       style: Theme.of(context).textTheme.headline4,
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _updateGreeting,
    //     tooltip: 'Greeting',
    //     child: Icon(Icons.insert_emoticon),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Widget"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          padding: const EdgeInsets.all(20.0),
          child: ToggleButtons(
            children: [
              Icon(Icons.airplanemode_off),
              Icon(Icons.airplanemode_on),
            ],
          ),
        ),
      ),
    );
  }

  Widget loadLocalImage() {
    return Image.asset("assets/flutter.png");
  }

  Widget loadInternetImage() {
    return Image.network(
        "https://github.com/ptyagicodecamp/flutter_cookbook2/raw/master/assets/flutter_icon.png");
  }
}
