import 'package:flutter/material.dart';

import 'package:ecom_app/models/item.dart';
import 'package:ecom_app/services/firestore.dart';

class ItemScreen extends StatelessWidget {
  final Item item;
  final Widget largeButton;
  final Widget smallButton;

  ItemScreen({this.item, this.largeButton, this.smallButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Item',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          child: Stack(children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image.network(item.imgUrl),
                    width: 200,
                    margin: EdgeInsets.all(20),
                  ),
                  Text(
                    item.name,
                    style: TextStyle(fontSize: 25, color: Colors.grey[600]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.price,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            Positioned(
              child: largeButton ?? FlatButton(
                child: Text(
                  'Add To My Cart',
                  style: TextStyle(color: Colors.white),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                color: Colors.blue[800],
                onPressed: () => addItem(item)
              ),
              bottom: 3,
              left: 5,
              right: 100,
            ),
            Positioned(
              child: Tooltip(
                message: 'Add To Wishlist',
                child: smallButton ?? FlatButton(
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                  color: Colors.red,
                  onPressed: () => print('Add to wishlist'),
                ),
              ),
              bottom: 3,
              right: 5,
            ),
          ]),
        ));
  }
}
