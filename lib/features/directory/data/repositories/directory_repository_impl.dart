import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:app_anime/core/error/failures.dart';
import 'package:app_anime/features/directory/domain/repositories/directory_repository.dart';
import 'package:app_anime/features/directory/data/datasources/directory_datasource.dart';
import 'package:app_anime/features/directory/data/models/directory_model.dart';

class DirectoryRepositoryImpl extends DirectoryRepository {
  DirectoryDatasource directoryDatasource;

  DirectoryRepositoryImpl({
    @required this.directoryDatasource
  });

  @override
  Future<Either<Failure, DirectoryModel>> getDirectory() async{
    DirectoryModel result = await directoryDatasource.getDirectory();
    return Future.value(Right(result));
  }
}