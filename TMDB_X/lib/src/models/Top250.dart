class Top250 {
  String? id;
  String? title;
  String? image;
  String? year;
  String? rank;
  String? imdbrating;


  Top250({
    required this.id,
    required this.title,
    required this.image,
    required this.year,
    required this.rank,
    required this.imdbrating
  });

  factory Top250.fromJson(Map<String, dynamic> json) {
    return Top250(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        year: json['year'],
        rank: json['rank'],
        imdbrating: json['imDbRating']
    );
  }
}