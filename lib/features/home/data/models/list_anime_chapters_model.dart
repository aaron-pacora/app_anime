import 'package:app_anime/features/home/data/models/anime_chapter_model.dart';
import 'package:app_anime/features/home/domain/entities/list_anime_chapters_entity.dart';
import 'package:meta/meta.dart';

class ListAnimeChaptersModel extends ListAnimeChaptersEntity{
  final Map<DateTime, Map<int, AnimeChapterModel>> list;

  ListAnimeChaptersModel({
    @required this.list
  });

  factory ListAnimeChaptersModel.fromJson(String dateJson, List<dynamic> dataAnime, { ListAnimeChaptersModel beforeData}){
    DateTime keyDateTime = DateTime.parse(dateJson.replaceAll("_", "-"));
    Map<int, AnimeChapterModel> listAnime = {};
    for (dynamic itemAnime in dataAnime) {
      AnimeChapterModel _animeChapterModel = AnimeChapterModel.fromJson(itemAnime);
      listAnime = {
        ...listAnime,
        _animeChapterModel.id: _animeChapterModel
      };
    }
    Map<DateTime, Map<int, AnimeChapterModel>> newList;
    if(beforeData != null){
      newList = {
        ...beforeData.list,
        keyDateTime: listAnime
      };
    }else{
      newList = {
        keyDateTime: listAnime
      };
    }
    return ListAnimeChaptersModel(list: newList);
  }

  @override
  List<Object> get props => [list];
}