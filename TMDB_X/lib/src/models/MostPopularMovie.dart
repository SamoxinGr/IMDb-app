class MostPopularMovie {
  String? id;
  String? title;
  String? image;


  MostPopularMovie({
    required this.id,
    required this.title,
    required this.image,
  });

  factory MostPopularMovie.fromJson(Map<String, dynamic> json) {
    return MostPopularMovie(
      id: json['id'],
      title: json['title'],
      image: json['image']
    );
  }
}

