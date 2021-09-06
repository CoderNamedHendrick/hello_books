class ImageLinks {
  final String smallThumbnail;
  final String thumbnail;

  ImageLinks({required this.smallThumbnail, required this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(
      // ignore: unnecessary_null_comparison
      smallThumbnail: json != null ? json['smallThumbnail'] : '',
      // ignore: unnecessary_null_comparison
      thumbnail: json != null ? json['thumbnail'] : '',
    );
  }
}
