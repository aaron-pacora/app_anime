import 'package:dartz/dartz.dart';

import 'package:app_anime/core/error/failures.dart';
import 'package:app_anime/app/domain/entities/theme_entity.dart';
import 'package:app_anime/app/domain/repositories/theme_repository.dart';
import 'package:app_anime/core/usecases/usecase.dart';

class ChangeThemeUsercase implements UseCase<List<ThemeEntity>, TypesThemes> {
  final ThemeRepository repository;

  ChangeThemeUsercase(this.repository);

  @override
  Future<Either<Failure, List<ThemeEntity>>> call(TypesThemes typeTheme) async {
    switch (typeTheme) {
      case TypesThemes.ligth:
        return await repository.changeToLightTheme();
      case TypesThemes.dartk:
        return await repository.changeToDarkTheme();
      default:
        return await repository.changeToCustomTheme();
    }
  }
}