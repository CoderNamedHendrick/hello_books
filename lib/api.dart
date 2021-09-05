import 'package:http/http.dart' as http;

final apiKey = "";

// Making HTTP request
Future<String> makeHttpCall() async {
  final apiEndPoint =
      "https://www.googleapis.com/books/v1/volumes?key=$apiKey&q=python+programming";
  final http.Response response = await http
      .get(Uri.parse(apiEndPoint), headers: {'Accept': 'application/json'});

  // This will print 'flutter: Instance of 'Response' on console.
  print(response);
  return response.body;
}
