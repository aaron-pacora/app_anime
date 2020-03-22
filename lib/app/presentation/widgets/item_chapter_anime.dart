import 'package:app_anime/core/navigation/page_names.dart';
import 'package:app_anime/core/utils/int_utils.dart';
import 'package:app_anime/features/home/domain/entities/anime_chapter_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemChapterAnime extends StatefulWidget {
  final AnimeChapterEntity animeChapterEntity;
  ItemChapterAnime({Key key, this.animeChapterEntity}) : super(key: key);

  @override
  _ItemChapterAnimeState createState() => _ItemChapterAnimeState();
}

class _ItemChapterAnimeState extends State<ItemChapterAnime> {
  AnimeChapterEntity animeChapterEntity;

  bool isFavorite;
  bool chapterSeen;

  String imageUrl;

  @override
  void initState() {
    animeChapterEntity = widget.animeChapterEntity;
    isFavorite = animeChapterEntity.isFavorite;
    chapterSeen = animeChapterEntity.chapterSeen;
    imageUrl = animeChapterEntity.urlCover;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            child: Row(
              children: <Widget>[
                getImageAnime(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            animeChapterEntity.title,
                            style: TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis, maxLines: 4,
                          )
                        ),
                        Text("Episodio "+animeChapterEntity.episode, style: TextStyle(fontSize: 18, color: Theme.of(context).accentColor))
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
          Container(color: Theme.of(context).canvasColor.withOpacity(.5), height: 1),
          Row(
            children: <Widget>[
              getButtonIcon(
                icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                onTap: (){
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
              getButtonIcon(
                icon: chapterSeen ? Icons.visibility : Icons.visibility_off,
                onTap: (){
                  setState(() {
                    chapterSeen = !chapterSeen;
                  });
                },
              ),
              getButtonIcon(
                icon: Icons.list,
                onTap: (){
                  Navigator.of(context).pushNamed(DETAIL_ANIME_PAGE, arguments: {"anime_id": animeChapterEntity.id, "title": animeChapterEntity.title});
                },
              ),
              getButtonIcon(
                icon: Icons.play_arrow,
                onTap: (){},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget getImageAnime(){
    String totalViewed = IntUtils.abreviature(animeChapterEntity.totalViewed);
    return Stack(
      children: <Widget>[
        Container(
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
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.black45,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.visibility, size: 12, color: Colors.white),
                Padding(padding: EdgeInsets.only(right: 3)),
                Text(totalViewed, style: TextStyle(color: Colors.white, fontSize: 12))
              ],
            ),
          ),
        )
      ],
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