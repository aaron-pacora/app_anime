import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AnimeChapterEntity extends Equatable{
  final int id;
  final String title;
  final String urlCover;
  final String episode;
  final bool isFavorite;
  final bool chapterSeen;
  final int totalViewed;

  AnimeChapterEntity({
    @required this.id,
    @required this.title,
    @required this.urlCover,
    @required this.episode,
    @required this.chapterSeen,
    @required this.isFavorite,
    @required this.totalViewed,
  });

  @override
  List<Object> get props => [id, title, urlCover, episode, chapterSeen, isFavorite, totalViewed];
}