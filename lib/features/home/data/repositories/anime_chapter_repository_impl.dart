import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:app_anime/core/error/failures.dart';
import 'package:app_anime/features/home/data/datasources/anime_chapter_datasource.dart';
import 'package:app_anime/features/home/data/models/list_anime_chapters_model.dart';
import 'package:app_anime/features/home/domain/repositories/anime_chapter_repository.dart';

class AnimeChapterRepositoryImpl extends AnimeChapterRepository {
  AnimeChapterDatasource animeChapterDatasource;

  AnimeChapterRepositoryImpl({
    @required this.animeChapterDatasource
  });

  @override
  Future<Either<Failure, ListAnimeChaptersModel>> getListAnime() async{
    ListAnimeChaptersModel result = await animeChapterDatasource.getListAnime();
    return Future.value(Right(result));
  }
}