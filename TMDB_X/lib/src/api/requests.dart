import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tmdb_x/src/models/MostPopularMovie.dart';
import 'package:tmdb_x/src/models/MostPopularTVs.dart';
import '../models/BoxOffice.dart';
import '../models/Top250.dart';
import '../models/InTheaters.dart';
import '../api/auth.dart' as auth;

Future<List<MostPopularMovie>> getMostPopularMovie() async {

  final Map<String, String> getMostPopularMovieHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  final Response getMostPopularMovieResponse = await http.get(
      Uri.https('${auth.baseUrl}', '/en/API/MostPopularMovies/${auth.uToken}'),
      headers: getMostPopularMovieHeaders);

  if (getMostPopularMovieResponse.statusCode == 200) {
    List<MostPopularMovie> myList = [];
    int numberOfMostPopularMovie = 10;
    // If the server did return a 200 CREATED response,
    var data = convert.jsonDecode(getMostPopularMovieResponse.body);
    for (int i = 0; i < numberOfMostPopularMovie; i++) {
      myList.add(MostPopularMovie.fromJson(data["items"][i]));
    }
    return myList;
  } else {
    // If the server did not return a 200 CREATED response,
    var statusCode = getMostPopularMovieResponse.statusCode;
    throw Exception(
        'Failed to get Movies USER response. Status code = $statusCode');
  }
}

Future<List<MostPopularTVs>> getMostPopularTVs() async {

  final Map<String, String> getMostPopularTVsHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  final Response getMostPopularTVsResponse = await http.get(
      Uri.https('${auth.baseUrl}', '/en/API/MostPopularTVs/${auth.uToken}'),
      headers: getMostPopularTVsHeaders);

  if (getMostPopularTVsResponse.statusCode == 200) {
    List<MostPopularTVs> myList = [];
    int numberOfMostPopularTVs = 10;
    // If the server did return a 200 CREATED response,
    var data = convert.jsonDecode(getMostPopularTVsResponse.body);
    for (int i = 0; i < numberOfMostPopularTVs; i++) {
      myList.add(MostPopularTVs.fromJson(data["items"][i]));
    }
    return myList;
  } else {
    // If the server did not return a 200 CREATED response,
    var statusCode = getMostPopularTVsResponse.statusCode;
    throw Exception(
        'Failed to get Movies USER response. Status code = $statusCode');
  }
}

Future<List<Top250>> getTop250(String choice) async {

  final Map<String, String> getTop250Headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  final Response getTop250Response = await http.get(
      Uri.https('${auth.baseUrl}', '/en/API/Top250$choice/${auth.uToken}'),
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

Future<List<InTheaters>> getInTheaters() async {

  final Map<String, String> getInTheatersHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  final Response getInTheatersResponse = await http.get(
      Uri.https('${auth.baseUrl}', '/en/API/InTheaters/${auth.uToken}'),
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

Future<List<BoxOffice>> getBoxOffice() async {

  final Map<String, String> getBoxOfficeHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  final Response getBoxOfficeResponse = await http.get(
      Uri.https('${auth.baseUrl}', '/en/API/BoxOfficeAllTime/${auth.uToken}'),
      headers: getBoxOfficeHeaders);

  if (getBoxOfficeResponse.statusCode == 200) {
    List<BoxOffice> myList = [];
    int numberOfBoxOffice = 10;
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
        'Failed to get Movies USER response. Status code = $statusCode');
  }
}