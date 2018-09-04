import 'dart:async';

import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/ui_elements/title_default.dart';
import '../scoped-model/main.dart';

class ProductPage extends StatelessWidget {

  final Product product;

  ProductPage(this.product);

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

  Widget _buildAddressPriceRow(double price) {
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
            title: Text(product.title),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FadeInImage(
                image: NetworkImage(product.image),
                placeholder: AssetImage('assets/food.jpg'),
                height: 300.0,
                fit: BoxFit.cover,
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: TitleDefault(product.title)
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: _buildAddressPriceRow(product.price),
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(product.description,  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400),)
              ),

            ],
          ),
        )
    );
  }
}
