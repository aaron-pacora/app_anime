import 'package:flutter/material.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {

  @override
  final Size preferredSize; // default is 56.0
  final String title;
  
  DefaultAppBar({
    Key key,
    @required this.title
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
      centerTitle: false,
      title: toSearch ? getInputSearch() : Text(widget.title),
      leading: toSearch ? IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
        setState(() {
          toSearch = false;
        });
      }) : null,
      actions: toSearch ? [] : <Widget>[
        IconButton(icon: Icon(Icons.search), tooltip: "Buscar anime", onPressed: (){
          setState(() {
            toSearch = true;
          });
        }),
        IconButton(icon: Icon(Icons.format_paint), tooltip: "Personalizar", onPressed: (){}),
      ],
    );
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
            onChanged: (text){
              setState(() {
                textSearch = text;
              });
            },
            decoration : InputDecoration(
              border: InputBorder.none,
              hintText: "Buscar ...",
              suffixIcon: textSearch.length > 0 ? IconButton(
                onPressed: (){
                  _controllerInputSearch.clear();
                  setState(() {
                    textSearch = "";
                  });
                },
                icon: Icon(Icons.clear),
              ) : null 
            ),
          )
        )
      ],
    );
  }
}