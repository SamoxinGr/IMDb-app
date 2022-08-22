import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../api/requests.dart';
import '../../../models/SearchResult.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {

  SearchCubit() : super(SearchInitial());

  Future<void> informInitial() async {
    if (kDebugMode) {
      print("Search page is loading");
    }
  }

  Future<void> loadSearch(String value) async {
    print(value);
    try {
        if (value.length > 0) {
          //await Future.delayed(const Duration(milliseconds: 200));
          final search_list = await getSearchList(value);
          emit(SearchLoadedState(search_list));
          print('Search loaded');
        }
        else {emit(SearchInitial());}
    } catch (e){
      if (isClosed == false) {
        emit(SearchErrorState());
      }
    }
  }

  Future<void> reloadSearch() async {
    if (isClosed == false) {
      print("haha");
      emit(SearchInitial());
    }
  }
}

