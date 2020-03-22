import 'package:flutter/material.dart';

import 'package:app_anime/core/widgets/default_card.dart';

class InfoView extends StatelessWidget {
  const InfoView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      padding: EdgeInsets.only(top: 5),
      child: Row(
        children: <Widget>[
          getRowData(title: "36 K", subtitle: "Vistas"),
          getRowData(title: "12", subtitle: "Episodios"),
          getRowData(title: "23 min.", subtitle: "Duración"),
        ]
      )
    );
  }

  Widget getRowData({@required String title, @required String subtitle}){
    return Expanded(child: ListTile(
      contentPadding: EdgeInsets.zero,
      title: Container(child: Center(child: Text(title, style: TextStyle(fontSize: 20),))),
      subtitle: Center(child: Text(subtitle)),
    ));
  }
}