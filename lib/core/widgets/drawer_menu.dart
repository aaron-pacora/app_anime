import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';

import 'package:app_anime/app/presentation/bloc/theme_bloc.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: new EdgeInsets.only(top: 0),
        children: <Widget>[
          getRowHead(context),
          getItemMenu("Recientes",Icons.home),
          getItemMenu("Directorio",Icons.video_library),
          getItemMenu("En emisión",Icons.ondemand_video),
          getItemMenu("Favoritos y más",Icons.favorite),
          getItemMenu("Mis notificaciones",Icons.notifications),
          getItemMenu("Cerrar sesión", FeatherIcons.logOut),
          Divider(),
          getItemMenu("Mis vídeos",Icons.videocam),
          getItemMenu("Chat",Icons.chat),
          getItemMenu("Grupo Seguidores",Icons.group),
          getItemMenu("Foro - Encuestas",Icons.record_voice_over),
          getItemMenu("Noticias de Ecma",FeatherIcons.radio),
          Divider(),
          getItemMenu("Tienda Legión",Icons.shopping_cart),
          getItemMenu("Música Random",Icons.music_note),
          getItemMenu("Manga Libre",Icons.import_contacts),
          getItemMenu("Versiones anteriores",Icons.perm_device_information),
          Divider(),
          getItemMenu("Compartir",Icons.share),
          getItemMenu("Sugerencias",Icons.email),
          getItemMenu("Califícanos",Icons.tag_faces),
          getItemMenu("Política de Privacidad", FeatherIcons.shield),
        ],
      )
    );
  }

  Widget getRowHead(BuildContext context){
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColor.withOpacity(.6),
        ])
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/images/logo.png"),
              ),
              Spacer(),
              IconButton(icon: Icon(Icons.help, size: 20,), onPressed: (){
                print("help");
              }),
              IconButton(icon: Icon(Icons.settings, size: 20,), onPressed: (){
                print("settings");
              }),
              BlocBuilder<ThemeBloc, ThemeState>(
                builder: (_, ThemeState state){
                  IconData iconData = Icons.brightness_3;
                  if(state is DarkThemeState){
                    iconData = Icons.wb_sunny;
                  }
                  return IconButton(icon: Icon(iconData, size: 20,), onPressed: (){
                    BlocProvider.of<ThemeBloc>(context).add(SwitchThemeEvent());
                  });
                }
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 8)),
          Text("Legion Anime v 1.1.4.2", style: TextStyle(color: Theme.of(context).textTheme.overline.color),),
          Text("luis_paco01@hotmail.com", style: TextStyle(color: Theme.of(context).textTheme.overline.color),),
        ],
      ),
    );
  }

  ListTile getItemMenu(String title, IconData icon){
    return ListTile(
      leading: Icon(icon),
      onTap: (){},
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
    );
  }

}