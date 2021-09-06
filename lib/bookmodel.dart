import 'package:hello_books/accessinfo.dart';
import 'package:hello_books/saleinfo.dart';
import 'package:hello_books/volumeinfo.dart';

class BookModel {
  final VolumeInfo volumeInfo;
  final AccessInfo accessInfo;
  final SaleInfo saleInfo;

  BookModel(
      {required this.volumeInfo,
      required this.accessInfo,
      required this.saleInfo});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      volumeInfo: VolumeInfo.fromJson(json['volumeInfo']),
      accessInfo: AccessInfo.fromJson(json['accessInfo']),
      saleInfo: SaleInfo.fromJson(json['saleInfo']),
    );
  }
}
