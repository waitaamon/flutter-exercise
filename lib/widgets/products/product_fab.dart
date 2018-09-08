import 'package:flutter/material.dart';

class ProductFab extends StatefulWidget {
  @override
  _ProductFabState createState() => new _ProductFabState();
}

class _ProductFabState extends State<ProductFab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 70.0,
          width: 56.0,
          alignment: FractionalOffset.topCenter,
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).cardColor,
            heroTag: 'contact',
            mini: true,
            onPressed: () {},
            child: Icon(Icons.mail_outline, color: Theme.of(context).primaryColor,),
          ),
        ),
        Container(
          height: 70.0,
          width: 56.0,
          alignment: FractionalOffset.topCenter,
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).cardColor,
            heroTag: 'favourite',
            mini: true,
            onPressed: () {},
            child: Icon(Icons.favorite_border, color: Colors.red,),
          ),
        ),

        FloatingActionButton(
          heroTag: 'options',
          onPressed: () {},
          child: Icon(Icons.more_vert),
        ),
      ]
    );
  }
}
