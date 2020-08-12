import 'dart:async';

import 'package:anime_finder/src/api/anime_repository.dart';
import 'package:anime_finder/src/models/anime_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AnimeRepository animeRepository = new AnimeRepository();

  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    final currentState = state;
    if (event is AnimeFetch) {
      try {
        if (currentState is HomeInitial) {
          final animes = await animeRepository.fetchAnimes();
            yield HomeSuccess(animeList: animes);
        }
      } on Exception catch (e) {
        yield HomeFailure();
      }
    }
  }

  @override
  Stream<Transition<HomeEvent, HomeState>> transformEvents(
      Stream<HomeEvent> events,
      TransitionFunction<HomeEvent, HomeState> transitionFn) {
      return super.transformEvents( events.debounceTime(const Duration(milliseconds: 500)), transitionFn);
  }
}
