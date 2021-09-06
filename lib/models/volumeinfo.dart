import 'package:hello_books/models/imagelinks.dart';

class VolumeInfo {
  final String title;
  final String subtitle;
  final String description;
  final List<dynamic> authors;
  final String publisher;
  final String publishedDate;
  final ImageLinks imageLinks;

  VolumeInfo({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.imageLinks,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
      title: json['title'],
      subtitle: json['subtitle'] ?? '',
      description: json['description'] ?? '',
      authors: json['authors'] as List,
      publisher: json['publisher'] ?? '',
      publishedDate: json['publishedDate'] ?? '',
      imageLinks: ImageLinks.fromJson(
        json['imageLinks'],
      ),
    );
  }
}
