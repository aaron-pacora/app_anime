import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:app_anime/core/widgets/app_bar/icon_refresh.dart';
import 'package:share/share.dart';

class DefaultSliverAppBar extends StatefulWidget {

  final String title;
  final String currentPageName;
  final String urlImage;

  DefaultSliverAppBar({
    Key key,
    @required this.title,
    @required this.currentPageName,
    this.urlImage:"",
  }): super(key: key);

  @override
  _DefaultSliverAppBarState createState() => _DefaultSliverAppBarState();
}

class _DefaultSliverAppBarState extends State<DefaultSliverAppBar>{

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: getIconActions(),
      expandedHeight: 150,
      pinned: true,
      title: Text(widget.title),
      flexibleSpace: widget.urlImage.isNotEmpty ? FlexibleSpaceBar(
        centerTitle: false,
        collapseMode: CollapseMode.parallax,
        background: Stack(
          children: <Widget>[
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: widget.urlImage,
              placeholder: (context, url) => Container(
                child: Image(image: AssetImage("assets/images/placeholder.png"))
              ),
              errorWidget: (context, url, error) => Container(
                child: Image(image: AssetImage("assets/images/placeholder.png"))
              )
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  colors: [Colors.black87, Colors.black54, Colors.black45]
                )
              ),
            )
          ],
        )
      ) : null
    );
  }

  List<Widget> getIconActions(){
    List<Widget> icons = [];
    icons.add(IconButton(icon: Icon(Icons.share), tooltip: "Compartir", onPressed: (){
      Share.share('Legión anime: https://legionanime.xyz/', subject: 'Todos tus animes en un solo lugar.');
    }));
    return icons;
  }

}