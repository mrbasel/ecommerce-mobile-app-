import 'package:flutter/material.dart';

import 'package:ecom_app/models/item.dart';

class ItemScreen extends StatelessWidget {
  final Item item;

  ItemScreen({this.item});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.network(item.imgUrl),
                width: 200,
                margin: EdgeInsets.all(20),
              ),
              Text(item.name, style: TextStyle(fontSize: 25, color: Colors.grey[600]), ),
              SizedBox(height: 10,),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item.price,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold
                    ),
                  )),
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
        ));
  }
}
