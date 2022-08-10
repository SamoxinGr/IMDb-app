import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../api/auth.dart' as auth;
import 'package:http/http.dart';
import '../models/ImagesForBoxOffice.dart';
import '../models/MostPopular.dart';
import '../models/BoxOffice.dart';
import '../models/Top250.dart';
import '../models/InTheaters.dart';

// horizontal wheels
Future<List<MostPopular>> getMostPopular(String choice) async {

  final Map<String, String> getMostPopularHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  final Response getMostPopularResponse = await http.get(
      Uri.https(auth.baseUrl, '/en/API/$choice/${auth.uToken}'),
      headers: getMostPopularHeaders);

  if (getMostPopularResponse.statusCode == 200) {
    List<MostPopular> myList = [];
    int numberOfMostPopular = 10;
    // If the server did return a 200 CREATED response,
    var data = convert.jsonDecode(getMostPopularResponse.body);
    for (int i = 0; i < numberOfMostPopular; i++) {
      myList.add(MostPopular.fromJson(data["items"][i]));
    }
    return myList;
  } else {
    // If the server did not return a 200 CREATED response,
    var statusCode = getMostPopularResponse.statusCode;
    throw Exception(
        'Failed to get Movies USER response. Status code = $statusCode');
  }
}

// top 250 imdb movies and tvs for tabbar
Future<List<Top250>> getTop250(String choice) async {

  final Map<String, String> getTop250Headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  final Response getTop250Response = await http.get(
      Uri.https(auth.baseUrl, '/en/API/Top250$choice/${auth.uToken}'),
      headers: getTop250Headers);

  if (getTop250Response.statusCode == 200) {
    List<Top250> myList = [];
    int numberOfTop250 = 10;
    // If the server did return a 200 CREATED response,
    var data = convert.jsonDecode(getTop250Response.body);
    for (int i = 0; i < numberOfTop250; i++) {
      myList.add(Top250.fromJson(data["items"][i]));
    }
    return myList;
  } else {
    // If the server did not return a 200 CREATED response,
    var statusCode = getTop250Response.statusCode;
    throw Exception(
        'Failed to get Movies USER response. Status code = $statusCode');
  }
}

// news in theaters for tabbar
Future<List<InTheaters>> getInTheaters() async {

  final Map<String, String> getInTheatersHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  final Response getInTheatersResponse = await http.get(
      Uri.https(auth.baseUrl, '/en/API/InTheaters/${auth.uToken}'),
      headers: getInTheatersHeaders);

  if (getInTheatersResponse.statusCode == 200) {
    List<InTheaters> myList = [];
    int numberOfInTheaters = 10;
    // If the server did return a 200 CREATED response,
    var data = convert.jsonDecode(getInTheatersResponse.body);
    for (int i = 0; i < numberOfInTheaters; i++) {
      myList.add(InTheaters.fromJson(data["items"][i]));
    }
    return myList;
  } else {
    // If the server did not return a 200 CREATED response,
    var statusCode = getInTheatersResponse.statusCode;
    throw Exception(
        'Failed to get Movies USER response. Status code = $statusCode');
  }
}

// boxoffice for tabbar
Future<List<BoxOffice>> getBoxOffice() async {

  final Map<String, String> getBoxOfficeHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  final Response getBoxOfficeResponse = await http.get(
      Uri.https(auth.baseUrl, '/en/API/BoxOfficeAllTime/${auth.uToken}'),
      headers: getBoxOfficeHeaders);

  if (getBoxOfficeResponse.statusCode == 200) {
    List<BoxOffice> myList = [];
    int numberOfBoxOffice = 5;
    // If the server did return a 200 CREATED response,
    var data = convert.jsonDecode(getBoxOfficeResponse.body);
    for (int i = 0; i < numberOfBoxOffice; i++) {
      myList.add(BoxOffice.fromJson(data["items"][i]));
    }
    return myList;
  } else {
    // If the server did not return a 200 CREATED response,
    var statusCode = getBoxOfficeResponse.statusCode;
    throw Exception(
        'Failed to get Movies response. Status code = $statusCode');
  }
}

// need to take picture of movies from another API (in progress)
Future<String?> getImageForBox(String? id_imdb) async {

  final Map<String, String> getImageForBoxbody = {
    'token': auth.kinoToken,
    'search': '${id_imdb}',
    'field': 'externalId.imdb',
  };

  final Map<String, String> getImageForBoxHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  final Response getImageForBoxResponse = await http.get(
      Uri.https('api.kinopoisk.dev', '/movie', getImageForBoxbody),
      headers: getImageForBoxHeaders);

  if (getImageForBoxResponse.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    var data = convert.jsonDecode(getImageForBoxResponse.body);
    ImageForBox link = ImageForBox.fromJson(data['poster']);
    print(link.poster);
    return link.poster;
  } else {
    // If the server did not return a 200 CREATED response,
    var statusCode = getImageForBoxResponse.statusCode;
    throw Exception(
        'Failed to get Movies USER response. Status code = $statusCode');
  }
}  // in work