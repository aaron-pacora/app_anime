import 'package:dartz/dartz.dart';

import 'package:app_anime/core/error/failures.dart';
import 'package:app_anime/features/home/domain/entities/list_anime_chapters_entity.dart';

abstract class AnimeChapterRepository {
  Future<Either<Failure, ListAnimeChaptersEntity>> getListAnime();
}