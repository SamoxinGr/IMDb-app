part of 'search_cubit.dart';


@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {
}

class SearchLoadedState extends SearchState {
  SearchLoadedState();
}

class SearchErrorState extends SearchState {
  final String errorMessage;

  SearchErrorState(this.errorMessage);
}

