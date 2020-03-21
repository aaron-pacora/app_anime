import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:app_anime/features/home/data/models/list_anime_chapters_model.dart';

abstract class AnimeChapterDatasource {
  Future<ListAnimeChaptersModel> getListAnime();
}

class AnimeChapterDatasourceImpl extends AnimeChapterDatasource {

  @override
  Future<ListAnimeChaptersModel> getListAnime() async {
    String data = await rootBundle.loadString('data/chapters_anime.json');
    Map<String, dynamic> jsonResult = json.decode(data);
    ListAnimeChaptersModel listAnimeChaptersModel;
    jsonResult.forEach((key, value){
      listAnimeChaptersModel = ListAnimeChaptersModel.fromJson(key, value, beforeData: listAnimeChaptersModel);
    });
    return Future.value(listAnimeChaptersModel);
  }
}