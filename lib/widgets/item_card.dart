import 'package:flutter/material.dart';

import 'package:ecom_app/screens/item_screen.dart';
import 'package:ecom_app/models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final Widget trailingWidget;
  final Widget largeButton;
  final Widget smallButton;

  ItemCard({this.item, this.trailingWidget, this.largeButton, this.smallButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              child: Image.network(item.imgUrl),
              height: 220,
              width: 120,
              margin: EdgeInsets.only(right: 20),
            ),
            Expanded(
              child: Align(
                alignment: Alignment(-0.9, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.name,
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${item.price.toString()}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            trailingWidget ?? SizedBox()
          ],
        ),
      ),
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => ItemScreen(item: item, largeButton: largeButton, smallButton: smallButton,))),
    );
  }
}
