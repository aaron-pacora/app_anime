import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:app_anime/app/data/datasource/theme_local_datasource.dart';
// import 'package:app_anime/app/data/repositories/theme_repository_impl.dart';
// import 'package:app_anime/app/domain/repositories/theme_repository.dart';
import 'package:app_anime/app/presentation/bloc/theme_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Theme
  // Bloc
  sl.registerFactory(
    () => ThemeBloc()
  );

  // Use cases
  // sl.registerLazySingleton(() => GetCurrentThemeUsercase(sl()));

  // Repository
  // sl.registerLazySingleton<ThemeRepository>(
  //   () => ThemeRepositoryImpl(
  //     themeLocalDatasource: sl()
  //   ),
  // );

  // Data sources
  // sl.registerLazySingleton<ThemeLocalDatasource>(
  //   () => ThemeLocalDatasourceImpl(sharedPreferences: sl())
  // );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}