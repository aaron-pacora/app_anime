import 'package:flutter/material.dart';

import 'package:app_anime/core/widgets/default_card.dart';

class InfoListChapters extends StatefulWidget {
  InfoListChapters({Key key}) : super(key: key);

  @override
  _InfoListChaptersState createState() => _InfoListChaptersState();
}

class _InfoListChaptersState extends State<InfoListChapters> {

  int totalChapters = 12;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [getHeaderCard()];
    for (var i = totalChapters; i > 0; i--) {
      list.add(getItemChapter(episode: i.toString(), date: "02-30-2002", totalViews: "172"));
      if(i != 1){
        list.add(Container(color: Theme.of(context).canvasColor.withOpacity(.5), height: 1),);
      }
    }
    return DefaultCard(
      padding: EdgeInsets.only(top: 5),
      child: Column(children: list)
    );
  }

  Widget getHeaderCard(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: <Widget>[
          Text("Listado", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Spacer(),
          IconButton(icon: Icon(Icons.refresh), onPressed: (){})
        ],
      ),
    );
  }

  Widget getItemChapter({String episode, String date, String totalViews}){
    return ListTile(
      title: Text("Episodio " + episode),
      subtitle: Text(date),
      leading: Column(
      children: <Widget>[
        SizedBox(
          width: 35,
          height: 35,
          child: IconButton(icon: Icon(Icons.visibility, size: 20,), onPressed: (){
            print("Visto!");
          })
        ),
        Text(totalViews, style: TextStyle(fontSize: 12),)
      ],
    ),
      trailing: Icon(Icons.play_arrow),
      onTap: (){},
    );
  }
}