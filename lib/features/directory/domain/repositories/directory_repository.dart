import 'package:dartz/dartz.dart';

import 'package:app_anime/core/error/failures.dart';
import 'package:app_anime/features/directory/domain/entities/directory_entity.dart';

abstract class DirectoryRepository {
  Future<Either<Failure, DirectoryEntity>> getDirectory();
}