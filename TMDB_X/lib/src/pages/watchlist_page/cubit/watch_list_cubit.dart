import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {

  WatchListCubit() : super(WatchListInitial());

  Future<void> informInitial() async {
    print('WatchListPage initial');
  }

  Future<void> loadWatchList() async {
    try {
      /*if (isClosed == false) {
        emit(OpenLoadingState());
      }*/
      ///final user = await getUser((await UserSecureStorage.getTokenFromStorage())!, username);
      /*if (isClosed == false) {
        emit(OpenLoadedState());
      }*/
      emit(WatchListLoadedState());
      print('WatchList loaded');
    } catch (e){
      if (isClosed == false) {
        emit(WatchListErrorState('Failed User Load $e'));
      }
    }
  }

  Future<void> reloadWatchList() async {
    if (isClosed == false) {
      print("haha");
      emit(WatchListInitial());
    }
  }
}

