class AccessInfo {
  String webReaderLink;
  AccessInfo({required this.webReaderLink});

  factory AccessInfo.fromJson(Map<String, dynamic> json) {
    return AccessInfo(webReaderLink: json['webReaderLink']);
  }
}
