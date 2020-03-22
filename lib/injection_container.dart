import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_anime/app/presentation/bloc/theme_bloc.dart';

import 'package:app_anime/features/home/data/datasources/anime_chapter_datasource.dart';
import 'package:app_anime/features/home/data/repositories/anime_chapter_repository_impl.dart';
import 'package:app_anime/features/home/domain/repositories/anime_chapter_repository.dart';
import 'package:app_anime/features/home/domain/usecases/get_list_anime_usecase.dart';
import 'package:app_anime/features/home/presentation/bloc/list_anime_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Theme
  // Bloc
  sl.registerFactory(
    () => ThemeBloc()
  );
  sl.registerFactory(
    () => ListAnimeBloc(sl())
  );

  // Use cases
  sl.registerLazySingleton(() => GetListAnimeUsecase(sl()));

  // Repository
  sl.registerLazySingleton<AnimeChapterRepository>(
    () => AnimeChapterRepositoryImpl(
      animeChapterDatasource: sl()
    ),
  );

  // Data sources
  sl.registerLazySingleton<AnimeChapterDatasource>(
    () => AnimeChapterDatasourceImpl()
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}