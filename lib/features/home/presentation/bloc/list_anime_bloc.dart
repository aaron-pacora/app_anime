import 'dart:async';
import 'package:app_anime/features/home/domain/entities/list_anime_chapters_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:app_anime/core/error/failures.dart';
import 'package:app_anime/core/usecases/usecase.dart';
import 'package:app_anime/features/home/domain/usecases/get_list_anime_usecase.dart';

part 'list_anime_event.dart';
part 'list_anime_state.dart';

class ListAnimeBloc extends Bloc<ListAnimeEvent, ListAnimeState> {

  GetListAnimeUsecase getListAnimeUsecase;
  ListAnimeBloc(
    GetListAnimeUsecase _getListAnimeUsecase
  ):assert(_getListAnimeUsecase != null),
  getListAnimeUsecase = _getListAnimeUsecase;

  @override
  ListAnimeState get initialState => LoadingListAnimeState();

  @override
  Stream<ListAnimeState> mapEventToState(
    ListAnimeEvent event,
  ) async* {
    if(event is GetListAnimeEvent){
      yield* _eitherListAnime(await getListAnimeUsecase(NoParams()));
    }
  }

  Stream<ListAnimeState> _eitherListAnime(Either<Failure, ListAnimeChaptersEntity> failureOrListAnime) async* {
    yield failureOrListAnime.fold((erroFailure) => LoadingListAnimeState(), (listAnimeChapterEntity){
      return DataListAnimeState(listAnimeChapterEntity);
    });
  }
}
