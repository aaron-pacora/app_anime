import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_anime/core/navigation/page_names.dart';
import 'package:app_anime/core/widgets/app_bar/default_app_bar.dart';
import 'package:app_anime/core/widgets/drawer_menu.dart';
import 'package:app_anime/app/presentation/widgets/item_directory_anime.dart';
import 'package:app_anime/features/directory/domain/entities/anime_entity.dart';
import 'package:app_anime/features/directory/domain/entities/directory_entity.dart';
import 'package:app_anime/features/directory/presentation/bloc/directory_bloc.dart';

import 'package:app_anime/injection_container.dart';

class DirectoryPage extends StatefulWidget {
  DirectoryPage({Key key}) : super(key: key);

  @override
  _DirectoryPageState createState() => _DirectoryPageState();
}

class _DirectoryPageState extends State<DirectoryPage> {
  final DirectoryBloc _directoryBloc = sl<DirectoryBloc>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _directoryBloc.add(GetDirectoryEvent())
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _directoryBloc,
      child: Scaffold(
        appBar: DefaultAppBar( currentPageName: DIRECTORY_PAGE, title: "Directorio", showRefreshAction: false),
        drawer: DrawerMenu(currentPage: DIRECTORY_PAGE),
        body: BlocBuilder<DirectoryBloc, DirectoryState>(
          builder: (_, state){
            if(state is LoadingDirectoryState){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            DirectoryEntity listAnimeChaptersEntity;
            if(state is DataDirectoryState){
              listAnimeChaptersEntity = state.data;
            }
            List<Widget> dataWidgets = [];
            listAnimeChaptersEntity.list.forEach((dateKey, AnimeEntity animeEntity){
              dataWidgets.add(ItemDirectoryAnime(animeEntity: animeEntity));
            });
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              children: <Widget>[
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: dataWidgets,
                )
              ],
            );
          }
        ),
      )
    );
  }
}