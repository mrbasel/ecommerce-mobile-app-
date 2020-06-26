import 'package:flutter/material.dart';

showSnackBar(context, {@required String msg}) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
      )
      );
}


SnackBar addItemSnackBar = SnackBar(
  content: Text('Item added to cart'),
  duration: Duration(seconds: 2),
  );


SnackBar deleteItemSnackBar = SnackBar(
  content: Text('Item removed from cart'),
  duration: Duration(seconds: 2),
  );