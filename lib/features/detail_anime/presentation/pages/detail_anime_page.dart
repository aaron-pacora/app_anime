import 'package:app_anime/features/detail_anime/presentation/widgets/info_genders.dart';
import 'package:app_anime/features/detail_anime/presentation/widgets/info_list_chapters.dart';
import 'package:app_anime/features/detail_anime/presentation/widgets/info_synopsis.dart';
import 'package:flutter/material.dart';

import 'package:app_anime/features/detail_anime/presentation/widgets/info_anime.dart';
import 'package:app_anime/features/detail_anime/presentation/widgets/info_data.dart';
import 'package:app_anime/features/detail_anime/presentation/widgets/info_view.dart';

import 'package:app_anime/core/navigation/page_names.dart';
import 'package:app_anime/core/widgets/drawer_menu.dart';
import 'package:app_anime/core/widgets/app_bar/sliver_app_bar.dart';

class DetailAnimePage extends StatefulWidget {
  final int animeId;
  final String title;

  DetailAnimePage({
    Key key,
    @required this.title,
    @required this.animeId
  }) : super(key: key);

  @override
  _DetailAnimePageState createState() => _DetailAnimePageState();
}

class _DetailAnimePageState extends State<DetailAnimePage> {

  bool isFavorite = false;

  String urlImageCover = "https://www.tvovermind.com/wp-content/uploads/2018/11/Overlord-750x363.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value){
            return [ DefaultSliverAppBar(
              title: widget.title,
              currentPageName: DETAIL_ANIME_PAGE,
              urlImage: urlImageCover,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(child: Text("Información", style: TextStyle(fontSize: 16),)),
                  Tab(child: Text("Episodios", style: TextStyle(fontSize: 16),))
                ],
              )
            )];
          },
          body: TabBarView(
            children: <Widget>[
              getInformationPage(),
              getChaptersPage()
            ],
          )
          )
        ),
    );
  }

  Widget getInformationPage(){
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        InfoAnime(title: widget.title),
        InfoSynopsis(),
        InfoGenders(),
        InfoView(),
        InfoData()
      ]
    );
  }

  Widget getChaptersPage(){
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        InfoListChapters(),
      ]
    );
  }
}