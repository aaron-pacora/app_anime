import 'package:flutter/material.dart';

import 'package:app_anime/core/widgets/app_bar/icon_refresh.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {

  @override
  final Size preferredSize; // default is 56.0
  final String title;
  final String currentPageName;
  final bool centerTitle;
  final bool showSearchAction;
  final bool showRefreshAction;

  DefaultAppBar({
    Key key,
    @required this.title,
    @required this.currentPageName,
    this.centerTitle: false,
    this.showSearchAction: true,
    this.showRefreshAction: true,
  }) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  _DefaultAppBarState createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar>{

  bool toSearch = false;
  TextEditingController _controllerInputSearch = TextEditingController();
  String textSearch = "";

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: widget.centerTitle,
      title: toSearch ? getInputSearch() : Text(widget.title),
      leading: toSearch ? IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
        clearInput();
        setState(() {
          toSearch = false;
        });
      }) : IconButton(icon: Icon(Icons.menu), onPressed: (){
        Scaffold.of(context).openDrawer();
      }),
      actions: getIconActions(),
    );
  }

  List<Widget> getIconActions(){
    if(toSearch){
      return [];
    }
    List<Widget> icons = [];
    if(widget.showSearchAction){
      icons.add(IconButton(icon: Icon(Icons.search), tooltip: "Buscar anime", onPressed: (){
        setState(() {
          toSearch = true;
        });
      }));
    }
    if(widget.showRefreshAction){
      icons.add(IconRefresh.getIcon(context: context, currentPageName: widget.currentPageName));
    }
    return icons;
  }

  Widget getInputSearch(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      verticalDirection: VerticalDirection.up,
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: _controllerInputSearch,
            textAlignVertical: TextAlignVertical.center,
            maxLines: 1,
            autofocus: true,
            onChanged: (text){
              setState(() {
                textSearch = text;
              });
            },
            decoration : InputDecoration(
              border: InputBorder.none,
              hintText: "Buscar ...",
              hintStyle: TextStyle(color: Colors.white70),
              suffixIcon: textSearch.length > 0 ? IconButton(
                onPressed: clearInput,
                icon: Icon(Icons.clear),
              ) : null
            ),
          )
        )
      ],
    );
  }

  void clearInput(){
    _controllerInputSearch.clear();
    setState(() {
      textSearch = "";
    });
  }
}