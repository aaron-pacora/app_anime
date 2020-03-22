import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:app_anime/features/detail_anime/presentation/pages/detail_anime_page.dart';
import 'package:app_anime/features/home/presentation/pages/recent_page.dart';
import 'package:app_anime/core/navigation/page_names.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    dynamic args = settings.arguments;
    Widget page;
    switch (settings.name) {
      case RECENT_PAGE:
        page = RecentPage();
      break;
      case DETAIL_ANIME_PAGE:
        page = DetailAnimePage(title: args["title"], animeId: args["anime_id"]);
      break;
      default:
        page = RecentPage();
    }
    if(Platform.isIOS){
      return CupertinoPageRoute(builder: (context) => page);
    }
    return MaterialPageRoute(builder: (context) => page);
  }
}