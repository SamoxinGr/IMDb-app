class SearchResult {
  String? id;
  String? title;
  String? image;


  SearchResult({
    required this.id,
    required this.title,
    required this.image,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
        id: json['id'],
        title: json['title'],
        image: json['image']
    );
  }
}