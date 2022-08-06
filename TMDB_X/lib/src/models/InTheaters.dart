class InTheaters {
  String? id;
  String? title;
  String? image;
  String? release;
  String? genre;
  String? imdbrating;


  InTheaters({
    required this.id,
    required this.title,
    required this.image,
    required this.release,
    required this.genre,
    required this.imdbrating
  });

  factory InTheaters.fromJson(Map<String, dynamic> json) {
    return InTheaters(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        release: json['releaseState'],
        genre: json['genreList'][0]['key'],
        imdbrating: json['imDbRating']
    );
  }
}