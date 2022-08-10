part of 'open_cubit.dart';


@immutable
abstract class OpenState {}

class OpenInitial extends OpenState {
}

class OpenLoadedState extends OpenState {
  final List<MostPopular> mpmList;
  final List<MostPopular> mptvsList;
  final List<Top250> movtopList;
  final List<Top250> tvstopList;
  final List<InTheaters> theaterList;
  final List<BoxOffice> boxList;
  OpenLoadedState(this.mpmList, this.mptvsList, this.movtopList, this.tvstopList, this.theaterList, this.boxList);//this.userInstance);
}

class OpenErrorState extends OpenState {
  final String errorMessage;

  OpenErrorState(this.errorMessage);
}
