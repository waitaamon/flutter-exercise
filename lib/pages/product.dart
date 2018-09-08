import 'dart:async';

import 'package:flutter/material.dart';

import 'package:map_view/map_view.dart';

import '../models/product.dart';
import '../widgets/ui_elements/title_default.dart';
import '../widgets/products/product_fab.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  ProductPage(this.product);

  void _showMap() {
    final List markers = <Marker>[
      Marker('position', 'Position', product.location.latitude,
          product.location.longitude)
    ];
    final cameraPosition = CameraPosition(
        Location(product.location.latitude, product.location.longitude), 14.0);
    final MapView mapView = MapView();
    mapView.show(
        MapOptions(
            initialCameraPosition: cameraPosition,
            mapViewType: MapViewType.normal,
            title: 'Product Location'),
        toolbarActions: [ToolbarAction('Close', 1)]);
    mapView.onToolbarAction.listen((int id) {
      if (id == 1) {
        mapView.dismiss();
      }
    });
    mapView.onMapReady.listen((_) {
      mapView.setMarkers(markers);
    });
  }

  Widget _buildAddressPriceRow(String address, double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: _showMap,
          child: Text(
            address,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Oswald'),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '|',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Text(
          ' \$' + price.toString(),
          style: TextStyle(
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
                  child: TitleDefault(product.title)),
              Container(
                padding: EdgeInsets.all(10.0),
                child: _buildAddressPriceRow(
                    product.location.address, product.price),
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    product.description,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  )),
            ],
          ),
          floatingActionButton: ProductFab(),
        ));
  }
}
