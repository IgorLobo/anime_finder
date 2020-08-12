part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeSuccess extends HomeState {
  final List<AnimeEntity> animeList;

  const HomeSuccess({this.animeList});

  HomeSuccess copyWith({List<AnimeEntity> animes}) {
    return HomeSuccess(animeList: animeList?? this.animeList);
  }

  @override
  List<Object> get props => [animeList];
}

class HomeFailure extends HomeState {}
