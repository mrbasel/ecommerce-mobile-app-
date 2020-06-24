import 'package:flutter/material.dart';

import 'package:ecom_app/widgets/item_card.dart';
import 'package:ecom_app/models/data.dart';
import 'package:ecom_app/models/item.dart';

import 'dart:math';

class CartScreen extends StatelessWidget {
  final List<Item> items;

  CartScreen({this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        child: items == null
            ? Align(
                alignment: Alignment(0, -0.7),
                child: Text(
                  'Your cart is empty',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ))
            : ListView(
                children: <Widget>[
                  Container(
                    child: Text(
                      'Items',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.all(30),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, int index) {
                        return ItemCard(item: items[index]);
                      }),
                ],
              ),
        // margin: EdgeInsets.all(40),
      ),
    );
  }
}
