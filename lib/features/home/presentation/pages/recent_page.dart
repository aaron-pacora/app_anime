import 'package:app_anime/core/utils/date_utils.dart';
import 'package:app_anime/features/home/domain/entities/anime_chapter_entity.dart';
import 'package:app_anime/features/home/domain/entities/list_anime_chapters_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_anime/app/presentation/widgets/item_chapter_anime.dart';
import 'package:app_anime/core/navigation/page_names.dart';
import 'package:app_anime/core/widgets/app_bar.dart';
import 'package:app_anime/core/widgets/drawer_menu.dart';
import 'package:app_anime/features/home/presentation/bloc/list_anime_bloc.dart';

import 'package:app_anime/injection_container.dart';

class RecentPage extends StatefulWidget {
  RecentPage({Key key}) : super(key: key);

  @override
  _RecentPageState createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  final ListAnimeBloc _listAnimeBloc = sl<ListAnimeBloc>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _listAnimeBloc.add(GetListAnimeEvent())
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _listAnimeBloc,
      child: Scaffold(
        appBar: DefaultAppBar(
          title: "Recientes",
        ),
        drawer: DrawerMenu(currentPage: RECENT_PAGE),
        body: BlocBuilder<ListAnimeBloc, ListAnimeState>(
          builder: (_, state){
            if(state is LoadingListAnimeState){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            ListAnimeChaptersEntity listAnimeChaptersEntity;
            if(state is DataListAnimeState){
              listAnimeChaptersEntity = state.data;
            }
            List<Widget> dataWidgets = [];
            listAnimeChaptersEntity.list.forEach((dateKey, Map<int, AnimeChapterEntity> animeChapters){
              String titleGroup = "";
              int diferences = DateUtils.calculateDifference(dateKey);
              switch (diferences) {
                case 0:
                  titleGroup = "Hoy";
                  break;
                case -1:
                  titleGroup = "Ayer";
                  break;
                default:
                  titleGroup = dateKey.day.toString().padLeft(2, '0')+"-"+dateKey.month.toString().padLeft(2, '0')+"-"+dateKey.year.toString();
              }
              dataWidgets.add(Center(
                heightFactor: 1.7,
                child: Text(
                  titleGroup,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ));
              animeChapters.forEach((int animeID, AnimeChapterEntity animeChapterEntity){
                dataWidgets.add(ItemChapterAnime(animeChapterEntity: animeChapterEntity));
              });
            });
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              children: dataWidgets,
            );
          }
        ),
      )
    );
  }
}