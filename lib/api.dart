import 'dart:convert';
import 'package:hello_books/models/bookmodel.dart';
import 'package:http/http.dart' as http;

final apiKey = "";

// Making HTTP request
Future<List<BookModel>> makeHttpCall() async {
  final apiEndPoint =
      "https://www.googleapis.com/books/v1/volumes?key=$apiKey&q=python+programming";
  final http.Response response = await http
      .get(Uri.parse(apiEndPoint), headers: {'Accept': 'application/json'});

  // Parsing API's HttpResponse to JSON format
  // Converting string response body to JSON representation
  final jsonObject = json.decode(response.body);

  var list = jsonObject['items'] as List;
  // return the list of book objects
  return list.map((e) => BookModel.fromJson(e)).toList();
}
