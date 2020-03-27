import 'package:dartz/dartz.dart';

import 'package:app_anime/core/error/failures.dart';
import 'package:app_anime/core/usecases/usecase.dart';
import 'package:app_anime/features/directory/domain/entities/directory_entity.dart';
import 'package:app_anime/features/directory/domain/repositories/directory_repository.dart';

class GetDirectoryUsecase implements UseCase<DirectoryEntity, NoParams> {
final DirectoryRepository repository;

  GetDirectoryUsecase(this.repository);

  @override
  Future<Either<Failure, DirectoryEntity>> call(NoParams noParams) async {
    return await repository.getDirectory();
  }
}