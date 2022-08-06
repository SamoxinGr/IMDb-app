import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_x/src/api/requests.dart';
import '../../../models/BoxOffice.dart';
import '../../../models/InTheaters.dart';
import '../../../models/MostPopularMovie.dart';
import '../../../models/MostPopularTVs.dart';
import '../../../models/Top250.dart';

part 'open_state.dart';

class OpenCubit extends Cubit<OpenState> {

  OpenCubit() : super(OpenInitial());

  Future<void> informInitial() async {
    print('OpenPage initial');
  }

  Future<void> loadOpen() async {
    try {
      /*if (isClosed == false) {
        emit(OpenLoadedState(popular_movie_info));
      }*/
      ///final user = await getUser(();
      /*if (isClosed == false) {
        emit(OpenLoadedState());
      }*/
      final popular_movie_info = await getMostPopularMovie();
      final popular_tvs_info = await getMostPopularTVs();
      final top250_movies = await getTop250("Movies");
      final top250_tvs = await getTop250("TVs");
      final in_theatres = await getInTheaters();
      final box_office = await getBoxOffice();
      emit(OpenLoadedState(popular_movie_info, popular_tvs_info, top250_movies, top250_tvs, in_theatres, box_office));
      print('Posters wheels loaded');
    } catch (e){
      if (isClosed == false) {
        emit(OpenErrorState('Failed User Load $e'));
      }
    }
  }

  Future<void> reloadUser() async {
    if (isClosed == false) {
      print("haha");
      emit(OpenInitial());
    }
  }
}

