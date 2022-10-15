import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../api/requests.dart';
import '../../../models/Details.dart';
import '../../../models/SearchResult.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {

  MovieCubit(id) : super(MovieInitial());

  Future<void> informInitial() async {
    if (kDebugMode) {
      print("Search page is loading");
    }
  }

  Future<void> loadMovie(String id) async {
    try {
      //await Future.delayed(const Duration(milliseconds: 500));
      final details_list = await getDetails(id);
        emit(MovieLoadedState(details_list));
        print('Movie loaded');
    } catch (e){
      if (isClosed == false) {
        emit(MovieErrorState());
      }
    }
  }

  Future<void> reloadMovie() async {
    if (isClosed == false) {
      print("haha");
      emit(MovieInitial());
    }
  }
}
