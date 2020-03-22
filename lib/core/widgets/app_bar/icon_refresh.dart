import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_anime/core/navigation/page_names.dart';
import 'package:app_anime/features/home/presentation/bloc/list_anime_bloc.dart';

class IconRefresh {
    static Widget getIcon({ @required BuildContext context, @required String currentPageName}){
      return IconButton(icon: Icon(Icons.refresh), tooltip: "Recargar", onPressed: () async{
        switch (currentPageName) {
          case RECENT_PAGE:
            final ListAnimeBloc _listAnimeBloc = BlocProvider.of<ListAnimeBloc>(context);
            _listAnimeBloc.add(LoadingListAnimeEvent());
            await (new Future.delayed(const Duration(seconds: 1), () => "1"));
            _listAnimeBloc.add(GetListAnimeEvent());
            break;
          default:
        }
      });
    }
}