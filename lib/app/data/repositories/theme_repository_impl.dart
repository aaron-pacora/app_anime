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

  Future<Either<Failure, ThemeModel>> getCurrentTheme() async{
    return Future.value(Right( await themeLocalDatasource.getTheme()));
  }
  Future<Either<Failure, ThemeModel>> changeToDarkTheme() async{
    return Future.value(Left(PreferencesFailure(message: "Error")));
  }
  Future<Either<Failure, ThemeModel>> changeToLightTheme() async{
    return Future.value(Left(PreferencesFailure(message: "Error")));
  }
  Future<Either<Failure, ThemeModel>> changeToCustomTheme() async{
    return Future.value(Left(PreferencesFailure(message: "Error")));
  }

}
