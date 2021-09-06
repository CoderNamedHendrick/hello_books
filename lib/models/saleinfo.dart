class SaleInfo {
  final String saleability;

  SaleInfo({
    required this.saleability,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) {
    return SaleInfo(
      saleability: json['saleability'],
    );
  }
}
