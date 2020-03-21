import 'package:app_anime/core/error/failures.dart';
import 'package:app_anime/core/usecases/usecase.dart';
import 'package:app_anime/features/home/domain/entities/list_anime_chapters_entity.dart';
import 'package:app_anime/features/home/domain/repositories/anime_chapter_repository.dart';
import 'package:dartz/dartz.dart';

class GetListAnimeUsecase implements UseCase<ListAnimeChaptersEntity, NoParams> {
final AnimeChapterRepository repository;

  GetListAnimeUsecase(this.repository);

  @override
  Future<Either<Failure, ListAnimeChaptersEntity>> call(NoParams noParams) async {
    return await repository.getListAnime();
  }
}