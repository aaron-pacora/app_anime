import 'package:meta/meta.dart';

import 'package:app_anime/features/directory/data/models/anime_model.dart';
import 'package:app_anime/features/directory/domain/entities/directory_entity.dart';

class DirectoryModel extends DirectoryEntity{
  final Map<int, AnimeModel> list;

  DirectoryModel({
    @required this.list
  });

  factory DirectoryModel.fromJson(dynamic dataAnime, { DirectoryModel beforeData}){
    Map<int, AnimeModel> listAnime = {};
    if(beforeData != null){
      listAnime = beforeData.list;
    }
    AnimeModel _animeModel = AnimeModel.fromJson(dataAnime);
    listAnime = {
      ...listAnime,
      _animeModel.id: _animeModel
    };
    return DirectoryModel(list: listAnime);
  }

  @override
  List<Object> get props => [list];
}