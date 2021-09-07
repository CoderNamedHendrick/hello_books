class SaleInfo {
  final String saleability;
  final String buyLink;

  SaleInfo({
    required this.saleability,
    required this.buyLink,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) {
    return SaleInfo(
      saleability: json['saleability'],
      buyLink: json['buyLink'] ?? '',
    );
  }
}
