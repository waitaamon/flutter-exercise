import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {

  final String title;
  final String imageUrl;
  final String description;
  final double price;

  ProductPage(this.title, this.imageUrl, this.description, this.price);

  void _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            title: Text('Are you Sure'),
            content: Text('This action cannot be undone!'),
            actions: <Widget>[
              FlatButton(onPressed: () {
                Navigator.pop(context);

              }, child: Text('CANCEL')),
              FlatButton(onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, true);
              }, child: Text('DELETE')),
            ],
          );
        }
    );
  }

  Widget _buildAddressPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Kenyatta Road, Juja Kenya | ',  style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Oswald'),
        ),
        Text(' \$' + price.toString(),  style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Oswald'),
        ),
      ],

    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
                padding: EdgeInsets.all(10.0),
                child: TitleDefault(title)
            ),
            Container(
                padding: EdgeInsets.all(10.0),
                child: _buildAddressPriceRow(),
            ),
            Container(
                padding: EdgeInsets.all(10.0),
                child: Text(description,  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),)
            ),

          ],
        ),
      ),
    );
  }
}
