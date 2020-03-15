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
      appBar: AppBar(
           title: Text("Legion anime"),
      ),
      drawer: DrawerMenu(),
      body: Text("hola :v"),
    );
  }
}