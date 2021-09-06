class ImageLinks {
  final String smallThumbnail;
  final String thumbnail;

  ImageLinks({required this.smallThumbnail, required this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(
      smallThumbnail: json != null ? json['smallThumbnail'] : '',
      thumbnail: json != null ? json['thumbnail'] : '',
    );
  }
}
