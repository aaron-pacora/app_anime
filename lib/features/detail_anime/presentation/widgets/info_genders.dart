import 'package:flutter/material.dart';

import 'package:app_anime/core/widgets/default_card.dart';

class InfoGenders extends StatelessWidget {
  const InfoGenders({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Géneros", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          Wrap(
            spacing: 10,
            children: <Widget>[
              Chip(label: Text("Terror")),
              Chip(label: Text("Drama")),
              Chip(label: Text("Sobrenatural")),
              Chip(label: Text("Misterio")),
              Chip(label: Text("Psicológico"))
            ],
          )
        ],
      )
    );
  }
}