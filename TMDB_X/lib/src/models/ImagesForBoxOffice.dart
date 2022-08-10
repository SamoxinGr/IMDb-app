// in progress
class ImageForBox {
  String? poster;

  ImageForBox({
    required this.poster,
  });

  factory ImageForBox.fromJson(Map<String, dynamic> json) {
    return ImageForBox(
        poster: json['url'],
    );
  }
}