part of 'movie_cubit.dart';


@immutable
abstract class MovieState {
  late final String id;
}

class MovieInitial extends MovieState {
}

class MovieLoadedState extends MovieState {
  final List<Details> detailList;
  MovieLoadedState(this.detailList);
}

class MovieErrorState extends MovieState {
  MovieErrorState();
}