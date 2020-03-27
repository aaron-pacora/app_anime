import 'package:meta/meta.dart';

import 'package:app_anime/features/directory/domain/entities/anime_entity.dart';

class AnimeModel extends AnimeEntity {
  final int id;
  final String title;
  final String urlCover;

  AnimeModel({
    @required this.id,
    @required this.title,
    @required this.urlCover
  });

  @override
  List<Object> get props => [id, title, urlCover];

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      id: json['id'],
      title: json['title'],
      urlCover: json['url_small_cover']
    );
  }
}