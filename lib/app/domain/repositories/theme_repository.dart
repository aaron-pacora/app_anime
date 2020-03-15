import 'package:app_anime/app/domain/entities/theme_entity.dart';
import 'package:app_anime/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ThemeRepository {
  Future<Either<Failure, ThemeEntity>> getCurrentTheme();
  Future<Either<Failure, ThemeEntity>> changeToDarkTheme();
  Future<Either<Failure, ThemeEntity>> changeToLightTheme();
  Future<Either<Failure, ThemeEntity>> changeToCustomTheme();
}
