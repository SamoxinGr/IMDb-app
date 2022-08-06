class BoxOffice {
  String? id;
  String? title;
  String? image;
  String? release;
  String? rank;
  String? bank;


  BoxOffice({
    required this.id,
    required this.title,
    required this.image,
    required this.release,
    required this.rank,
    required this.bank
  });

  factory BoxOffice.fromJson(Map<String, dynamic> json) {
    return BoxOffice(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        release: json['year'],
        rank: json['rank'],
        bank: json['worldwideLifetimeGross']
    );
  }
}