class MostPopular {
  String? id;
  String? title;
  String? image;


  MostPopular({
    required this.id,
    required this.title,
    required this.image,
  });

  factory MostPopular.fromJson(Map<String, dynamic> json) {
    return MostPopular(
      id: json['id'],
      title: json['title'],
      image: json['image']
    );
  }
}

