import 'package:flutter/material.dart';

import 'package:app_anime/core/widgets/default_card.dart';

class InfoData extends StatelessWidget {
  const InfoData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      padding: EdgeInsets.only(top: 10, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Datos:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Row(
            children: <Widget>[
              getListTile(
                title: "Emitido",
                subtitle: "06-01-2020",
                icon: Icons.timer
              ),
              getListTile(
                title: "Finalizado",
                subtitle: "---",
                icon: Icons.timer_off
              ),
            ],
          ),
          Row(
            children: <Widget>[
              getListTile(
                title: "Temporada",
                subtitle: "Invierno-2020",
                icon: Icons.calendar_today
              ),
              getListTile(
                title: "Estado",
                subtitle: "En emisión",
                icon: Icons.settings_input_antenna
              ),
            ],
          ),
          getListTile(
            title: "Próximo Episodio (aprox.)",
            subtitle: "25-03-2020 (Miércoles)",
            icon: Icons.schedule,
            expanded: false
          ),
        ],
      ),
    );
  }

  Widget getListTile({@required String title, @required String subtitle, @required IconData icon, bool expanded:true}){
    Row rowTile = Row(
      children: <Widget>[
        Icon(icon, size: 20),
        Expanded(child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle)
        ))
      ],
    );
    if(!expanded){
      return rowTile;
    }
    return Expanded(child: rowTile);
  }
}