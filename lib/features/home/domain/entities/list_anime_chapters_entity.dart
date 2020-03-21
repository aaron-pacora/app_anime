import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:app_anime/features/home/domain/entities/anime_chapter_entity.dart';

class ListAnimeChaptersEntity extends Equatable{
  final Map<DateTime, Map<int, AnimeChapterEntity>> list;

  ListAnimeChaptersEntity({
    @required this.list
  });

  @override
  List<Object> get props => [ list ];
}