import 'package:flutter/material.dart';

import 'price_tag.dart';
import '../ui_elements/title_default.dart';
import './address_tag.dart';

class ProductCard extends StatelessWidget {

  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleDefault(product['title']),
            SizedBox(
              width: 8.0,
            ),
            PriceTag(product['price'].toString())
          ]),
    );
  }

  Widget _buildActionbuttons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.info_outline),
            color: Theme.of(context).accentColor,
            onPressed: () => Navigator.pushNamed<bool>( context, '/product/' + productIndex.toString())
        ),
        IconButton(
            icon: Icon(Icons.favorite_border),
            color: Colors.redAccent,
            onPressed: () {}
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          _buildTitlePriceRow(),
          AddressTag('Kenyatta Road, Juja Kenya'),
          _buildActionbuttons(context)
        ],
      ),
    );;
  }
}
