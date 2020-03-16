import 'package:app_anime/core/widgets/app_bar.dart';
import 'package:app_anime/core/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';

class ListAnimesPage extends StatefulWidget {
  ListAnimesPage({Key key}) : super(key: key);

  @override
  _ListAnimesPageState createState() => _ListAnimesPageState();
}

class _ListAnimesPageState extends State<ListAnimesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "Recientes",
      ),
      drawer: DrawerMenu(),
      body: Text("hola :v"),
    );
  }
}