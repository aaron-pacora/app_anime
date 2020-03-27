import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_anime/app/presentation/bloc/theme_bloc.dart';

import 'package:app_anime/features/home/data/datasources/anime_chapter_datasource.dart';
import 'package:app_anime/features/home/data/repositories/anime_chapter_repository_impl.dart';
import 'package:app_anime/features/home/domain/repositories/anime_chapter_repository.dart';
import 'package:app_anime/features/home/domain/usecases/get_list_anime_usecase.dart';
import 'package:app_anime/features/home/presentation/bloc/list_anime_bloc.dart';

import 'package:app_anime/features/directory/data/datasources/directory_datasource.dart';
import 'package:app_anime/features/directory/data/repositories/directory_repository_impl.dart';
import 'package:app_anime/features/directory/domain/repositories/directory_repository.dart';
import 'package:app_anime/features/directory/domain/usecases/get_directory_usecase.dart';
import 'package:app_anime/features/directory/presentation/bloc/directory_bloc.dart';

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


  // Bloc
  sl.registerFactory(
    () => DirectoryBloc(sl())
  );

  // Use cases
  sl.registerLazySingleton(() => GetDirectoryUsecase(sl()));

  // Repository
  sl.registerLazySingleton<DirectoryRepository>(
    () => DirectoryRepositoryImpl(
      directoryDatasource: sl()
    ),
  );

  // Data sources
  sl.registerLazySingleton<DirectoryDatasource>(
    () => DirectoryDatasourceImpl()
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}