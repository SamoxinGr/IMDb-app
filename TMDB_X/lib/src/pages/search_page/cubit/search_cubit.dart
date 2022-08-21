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
        ///final user = await getUser((await UserSecureStorage.getTokenFromStorage())!, username);
        final search_list = await getSearchList(value);
        await Future.delayed(const Duration(milliseconds: 100));
        emit(SearchLoadedState(search_list));
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

