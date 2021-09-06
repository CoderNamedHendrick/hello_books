import 'dart:convert';

import 'package:http/http.dart' as http;

final apiKey = "AIzaSyC2citg8HavN-Rng_OZL0N5cJ7AHWpWEss";

// Making HTTP request
Future<dynamic> makeHttpCall() async {
  final apiEndPoint =
      "https://www.googleapis.com/books/v1/volumes?key=$apiKey&q=python+programming";
  final http.Response response = await http
      .get(Uri.parse(apiEndPoint), headers: {'Accept': 'application/json'});

  // Parsing API's HttpResponse to JSON format
  // Converting string response body to JSON representation
  final jsonObject = json.decode(response.body);

  // Prints JSON formatted response on console
  print(jsonObject);
  return jsonObject;
}
