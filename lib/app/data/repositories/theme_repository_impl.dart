import 'package:app_anime/app/data/datasource/theme_local_datasource.dart';
import 'package:app_anime/app/data/models/theme_model.dart';
import 'package:app_anime/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:app_anime/app/domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository{
  final ThemeLocalDatasource themeLocalDatasource;

  ThemeRepositoryImpl({
    @required this.themeLocalDatasource
  });

  Future<Either<Failure, List<ThemeModel>>> getCurrentTheme() async{
    await themeLocalDatasource.getTheme();
    return Future.value(Left(PreferencesFailure(message: "Error")));
  }
  Future<Either<Failure, List<ThemeModel>>> changeToDarkTheme() async{
    return Future.value(Left(PreferencesFailure(message: "Error")));
  }
  Future<Either<Failure, List<ThemeModel>>> changeToLightTheme() async{
    return Future.value(Left(PreferencesFailure(message: "Error")));
  }
  Future<Either<Failure, List<ThemeModel>>> changeToCustomTheme() async{
    return Future.value(Left(PreferencesFailure(message: "Error")));
  }

}
