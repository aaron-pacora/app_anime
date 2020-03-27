import 'package:app_anime/core/widgets/default_card.dart';
import 'package:app_anime/features/directory/domain/entities/anime_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemDirectoryAnime extends StatefulWidget {
  final AnimeEntity animeEntity;
  ItemDirectoryAnime({Key key, this.animeEntity}) : super(key: key);

  @override
  _IteDirectoryAnimeState createState() => _IteDirectoryAnimeState();
}

class _IteDirectoryAnimeState extends State<ItemDirectoryAnime> {
  AnimeEntity animeEntity;

  String imageUrl;

  @override
  void initState() {
    animeEntity = widget.animeEntity;
    imageUrl = animeEntity.urlCover;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: 170,
        child: Column(
          children: <Widget>[
            Container(
              width: 170,
              height: 200,
              child: getImageAnime()
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                animeEntity.title,
                style: TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis, maxLines: 1,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getImageAnime(){
    return Container(
      width: 125,
      height: 150,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) => Container(
          child: Image(image: AssetImage("assets/images/placeholder.png"))
        ),
        errorWidget: (context, url, error) => Container(
          child: Image(image: AssetImage("assets/images/placeholder.png"))
        ),
      ),
    );
  }

  Widget getButtonIcon({@required IconData icon, @required Function onTap}){
    return Expanded(
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: Icon(icon),
        ),
        onTap: onTap,
      ),
    );
  }
}