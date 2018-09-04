import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './product_edit.dart';
import '../scoped-model/main.dart';

class ProductListPage extends StatefulWidget {
  final MainModel model;
  ProductListPage(this.model);
  @override
  State<StatefulWidget> createState() {

    return _ProductListPageSate();
  }
}

class _ProductListPageSate extends State<ProductListPage> {
  @override
  initState() {
    widget.model.fetchProducts(onlyForUser: true);
    super.initState();
  }


  Widget _buildEditButton(BuildContext context, int index, MainModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectProduct(model.allProducts[index].id);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return ProductEditPage();
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Container(
              color: Colors.red,
            ),
            key: Key(model.allProducts[index].title),
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.endToStart) {
                model.selectProduct(model.allProducts[index].id);
                model.deleteProduct();
              } else if (direction == DismissDirection.startToEnd) {
                print('start to end');
              } else {
                print('other swipe');
              }
            },
            child: Column(children: <Widget>[
              ListTile(
                  leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(model.allProducts[index].image)),
                  title: Text(model.allProducts[index].title),
                  subtitle:
                      Text('\$${model.allProducts[index].price.toString()}'),
                  trailing: _buildEditButton(context, index, model)),
              Divider()
            ]),
          );
        },
        itemCount: model.allProducts.length,
      );
    });
  }
}
