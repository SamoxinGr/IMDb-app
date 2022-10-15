class Details {
  String? id;
  String? title;
  String? type;
  String? image;
  String? releaseDate;
  String? runtimeStr;
  String? plot;
  //Map<String, String>? directorList;
  ///Map<String, String>? writerList;
  //Map<String, String>? actorList;
  String? genre; //можно не лист
  //Map<String, String>? companyList;
  String? contentRating;
  String? imDbRating;
  String? metacriticRating;
  //Map<String, String>? images;
  //Map<String, String>? similars;


  Details({
    required this.id,
    required this.title,
    required this.type,
    required this.image,
    required this.releaseDate,
    required this.runtimeStr,
    required this.plot,
    //required this.directorList,
    //required this.writerList,
    //required this.actorList,
    required this.genre,
    //required this.companyList,
    required this.contentRating,
    required this.imDbRating,
    required this.metacriticRating,
    //required this.images,
    //required this.similars
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
        id: json['id'],
        title: json['title'],
        type: json['type'],
        image: json['image'],
        releaseDate: json['releaseDate'],
        runtimeStr: json['runtimeStr'],
        plot: json['plot'],
        //directorList: json['directorList'][0],
        //writerList: json['writerList'][0],
        //actorList: json['actorList'][0],
        genre: json['genres'],
        //companyList: json['companyList'][0],
        contentRating: json['contentRating'],
        imDbRating: json['imDbRating'],
        metacriticRating: json['metacriticRating'],
        //images: json['images']['items'][0],
        //similars: json['similars'][0],
    );
  }
}