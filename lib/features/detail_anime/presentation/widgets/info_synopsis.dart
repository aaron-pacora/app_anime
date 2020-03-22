import 'package:flutter/material.dart';

import 'package:app_anime/core/widgets/default_card.dart';

class InfoSynopsis extends StatefulWidget {
  InfoSynopsis({Key key}) : super(key: key);

  @override
  _InfoSynopsisState createState() => _InfoSynopsisState();
}

class _InfoSynopsisState extends State<InfoSynopsis> {

  String synopsis = "Un grupo de amigos de la infancia se separan debido a un trágico accidente en el cual perdieron a una de sus amigas. Jinta deberá reunir a sus antiguos amigos de la infancia ya que esa amiga que perdieron regresa como un espíritu para cumplir una promesa que hizo antes de morir, esta misión revelara nuevos y viejos sentimientos en los personajes para conseguir ese único deseo.";

  bool brokenDown = false;
  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Text("Sinospis", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Spacer(),
              IconButton(icon: Icon(brokenDown ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down), onPressed: (){
                setState(() {
                  brokenDown = !brokenDown;
                });
              })
            ],
          ),
          Text(synopsis, maxLines: brokenDown ? null : 3, overflow: brokenDown ? null : TextOverflow.ellipsis)
        ]),
      )
    );
  }
}