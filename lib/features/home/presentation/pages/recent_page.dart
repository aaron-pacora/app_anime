import 'package:app_anime/app/presentation/widgets/item_chapter_anime.dart';
import 'package:app_anime/core/navigation/page_names.dart';
import 'package:app_anime/core/widgets/app_bar.dart';
import 'package:app_anime/core/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';

class RecentPage extends StatefulWidget {
  RecentPage({Key key}) : super(key: key);

  @override
  _RecentPageState createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "Recientes",
      ),
      drawer: DrawerMenu(currentPage: RECENT_PAGE),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        itemBuilder: (BuildContext ctx, int i){
          return ItemChapterAnime();
        },
        itemCount: 10,
      ),
    );
  }
}