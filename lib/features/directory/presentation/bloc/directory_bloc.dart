import 'dart:async';
import 'package:app_anime/features/directory/domain/entities/directory_entity.dart';
import 'package:app_anime/features/directory/domain/usecases/get_directory_usecase.dart';
import 'package:app_anime/features/home/domain/entities/list_anime_chapters_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:app_anime/core/error/failures.dart';
import 'package:app_anime/core/usecases/usecase.dart';

part 'directory_event.dart';
part 'directory_state.dart';

class DirectoryBloc extends Bloc<DirectoryEvent, DirectoryState> {

  GetDirectoryUsecase getListAnimeUsecase;
  DirectoryBloc(
    GetDirectoryUsecase _getListAnimeUsecase
  ):assert(_getListAnimeUsecase != null),
  getListAnimeUsecase = _getListAnimeUsecase;

  @override
  DirectoryState get initialState => LoadingDirectoryState();

  @override
  Stream<DirectoryState> mapEventToState(
    DirectoryEvent event,
  ) async* {
    if(event is LoadingDirectoryEvent){
      yield LoadingDirectoryState();
    }else if(event is GetDirectoryEvent){
      yield* _eitherListAnime(await getListAnimeUsecase(NoParams()));
    }
  }

  Stream<DirectoryState> _eitherListAnime(Either<Failure, DirectoryEntity> failureOrListAnime) async* {
    yield failureOrListAnime.fold((erroFailure) => LoadingDirectoryState(), (directoryEntity){
      return DataDirectoryState(directoryEntity);
    });
  }
}
