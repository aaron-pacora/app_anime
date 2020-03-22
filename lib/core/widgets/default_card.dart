import 'package:flutter/material.dart';

class DefaultCard extends Card {
  @override
  final Clip clipBehavior;
  @override
  final Widget child;

  final EdgeInsets padding;

  DefaultCard({this.child, this.clipBehavior, this.padding});

  @override
  Widget build(BuildContext context) {
    Widget childCard;
    if(this.padding != null){
      childCard = Padding(padding: this.padding, child: this.child);
    }else {
      childCard = this.child;
    }
    return Card(
      clipBehavior: this.clipBehavior,
      margin: EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 15),
      child: childCard
    );
  }
}