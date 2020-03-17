import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemChapterAnime extends StatefulWidget {
  ItemChapterAnime({Key key}) : super(key: key);

  @override
  _ItemChapterAnimeState createState() => _ItemChapterAnimeState();
}

class _ItemChapterAnimeState extends State<ItemChapterAnime> {

  bool isFavoirute = false;
  bool chapterSeen = false;

  String imageUrl = "https://images-na.ssl-images-amazon.com/images/I/51mDfXoEwDL._AC_SX342_.jpg";

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
                            "Ano Hi Mita Hana no Namae o Bokutachi wa Mada Shiranai",
                            style: TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis, maxLines: 4,
                          )
                        ),
                        Text("Episodio 1", style: TextStyle(fontSize: 18, color: Theme.of(context).accentColor))
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
                icon: isFavoirute ? Icons.favorite : Icons.favorite_border,
                onTap: (){
                  setState(() {
                    isFavoirute = !isFavoirute;
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
                onTap: (){},
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
                Padding(padding: EdgeInsets.only(right: 2)),
                Text("548", style: TextStyle(color: Colors.white, fontSize: 12))
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