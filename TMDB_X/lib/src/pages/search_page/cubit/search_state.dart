part of 'search_cubit.dart';


@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {
}

class SearchLoadedState extends SearchState {
  final List<SearchResult> searchList;
  SearchLoadedState(this.searchList);
}

class SearchErrorState extends SearchState {
  SearchErrorState();
}


