import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {

  SearchCubit() : super(SearchInitial());

  Future<void> informInitial() async {
    print('SearchPage initial');
  }

  Future<void> loadSearch() async {
    try {
      /*if (isClosed == false) {
        emit(OpenLoadingState());
      }*/
      ///final user = await getUser((await UserSecureStorage.getTokenFromStorage())!, username);
      /*if (isClosed == false) {
        emit(OpenLoadedState());
      }*/
      emit(SearchLoadedState());
      print('Search loaded');
    } catch (e){
      if (isClosed == false) {
        emit(SearchErrorState('Failed User Load $e'));
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

