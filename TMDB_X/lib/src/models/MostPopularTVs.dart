class MostPopularTVs {
  String? id;
  String? title;
  String? image;


  MostPopularTVs({
    required this.id,
    required this.title,
    required this.image,
  });

  factory MostPopularTVs.fromJson(Map<String, dynamic> json) {
    return MostPopularTVs(
        id: json['id'],
        title: json['title'],
        image: json['image']
    );
  }
}