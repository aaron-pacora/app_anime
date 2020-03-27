import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:app_anime/features/directory/domain/entities/anime_entity.dart';

class DirectoryEntity extends Equatable{
  final Map<int, AnimeEntity> list;

  DirectoryEntity({
    @required this.list
  });

  @override
  List<Object> get props => [ list ];
}