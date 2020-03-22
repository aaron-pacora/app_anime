import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';

import 'package:app_anime/core/widgets/default_card.dart';
import 'package:app_anime/app/colors.dart';

class InfoAnime extends StatelessWidget {
  final String title;
  const InfoAnime({Key key, @required this.title}) : super(key: key);

  final bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      clipBehavior: Clip.antiAliasWithSaveLayer, child: Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 16)),
              Text("Anime", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Spacer(),
              Row(
                children: <Widget>[
                  Icon(Icons.star, size: 18),
                  Icon(Icons.star, size: 18),
                  Icon(Icons.star, size: 18),
                  Icon(Icons.star, size: 18),
                  Icon(Icons.star, size: 18),
                  Padding(padding: EdgeInsets.only(right: 3)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: BACKGROUND_COLOR,
                      borderRadius: BorderRadius.circular(3)
                    ),
                    child: Text("4", style: TextStyle(fontSize: 12, color: Theme.of(context).primaryColor)),
                  ),
                  IconButton(icon: Icon(FeatherIcons.checkSquare), onPressed: (){})
                ],
              )
            ],
          ),
          ListTile(
            title: Text("Nombre:", style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(this.title),
          ),
          ListTile(
            title: Text("Nombre Alternativo:", style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text("Anohana: The Flower We Saw That Day"),
          ),
          ListTile(
            title: Text("Título Japonés:", style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text("あの日見た花の名前を僕達はまだ知らない"),
          ),
          Container(color: Theme.of(context).canvasColor.withOpacity(.5), height: 1),
          Row(
            children: <Widget>[
              getButtonIcon(
                tooltip: "Favorito",
                icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                onTap: (){
                  // setState(() {
                  //   isFavorite = !isFavorite;
                  // });
                },
              ),
              getButtonIcon(
                tooltip: "Terminados",
                icon:Icons.label_outline,
                onTap: (){
                },
              ),
              getButtonIcon(
                tooltip: "Seguir",
                icon:Icons.label_outline,
                onTap: (){
                },
              ),
              getButtonIcon(
                tooltip: "Lista de espera",
                icon: Icons.bookmark_border,
                onTap: (){
                },
              ),
              getButtonIcon(
                tooltip: "Comentarios",
                icon: Icons.insert_comment,
                onTap: (){},
              ),
            ],
          )
        ],
      ),
    ));
  }

  Widget getButtonIcon({@required IconData icon, @required Function onTap, @required String tooltip}){
    return Expanded(
      child: InkWell(
        child: Tooltip(
          message: tooltip,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 3),
            child: Icon(icon),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}