import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:badges/badges.dart';

import 'package:ecom_app/screens/cart_screen.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  MainAppBar({Key key, this.title, this.color, this.elevation, this.showCart})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0
  final String title;
  final Color color;
  final elevation;
  final bool showCart;

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: widget.elevation,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: widget.color,
        actions: <Widget>[
          widget.showCart == false
              ? SizedBox()
              : IconButton(
                  icon: StreamBuilder(
                      stream:
                          Firestore.instance.collection('items').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return SizedBox();
                        return Badge(
                          badgeContent:
                              Text(snapshot.data.documents.length.toString()),
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                          ),
                        );
                      }),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen())))
        ]);
  }
}