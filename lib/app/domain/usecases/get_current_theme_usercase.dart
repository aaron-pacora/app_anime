import 'package:dartz/dartz.dart';

import 'package:app_anime/core/error/failures.dart';
import 'package:app_anime/app/domain/entities/theme_entity.dart';
import 'package:app_anime/app/domain/repositories/theme_repository.dart';
import 'package:app_anime/core/usecases/usecase.dart';

class GetCurrentThemeUsercase implements UseCase<List<ThemeEntity>, NoParams> {
  final ThemeRepository repository;

  GetCurrentThemeUsercase(this.repository);

  @override
  Future<Either<Failure, List<ThemeEntity>>> call(NoParams _) async {
    return await repository.getCurrentTheme();
  }
}