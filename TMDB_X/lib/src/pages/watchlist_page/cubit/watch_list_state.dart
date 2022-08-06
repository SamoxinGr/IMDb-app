part of 'watch_list_cubit.dart';


@immutable
abstract class WatchListState {}

class WatchListInitial extends WatchListState {
}

class WatchListLoadedState extends WatchListState {
  WatchListLoadedState();
}

class WatchListErrorState extends WatchListState {
  final String errorMessage;

  WatchListErrorState(this.errorMessage);
}

