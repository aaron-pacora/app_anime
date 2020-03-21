import 'package:meta/meta.dart';

import 'package:app_anime/features/home/domain/entities/anime_chapter_entity.dart';

class AnimeChapterModel extends AnimeChapterEntity {
  final int id;
  final String title;
  final String urlCover;
  final String episode;
  final bool isFavorite;
  final bool chapterSeen;
  final int totalViewed;

  AnimeChapterModel({
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

  factory AnimeChapterModel.fromJson(Map<String, dynamic> json) {
    return AnimeChapterModel(
      id: json['id'],
      title: json['title'],
      urlCover: json['url_small_cover'],
      episode: json['episode'].toString(),
      totalViewed: json['viewed'],
      isFavorite: json['is_favorite'],
      chapterSeen: json['chapter_seen']
    );
  }
}