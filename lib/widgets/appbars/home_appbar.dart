import 'package:flutter/material.dart';

import 'package:ecom_app/screens/cart_screen.dart';

// AppBar homeAppBar = AppBar(
//   centerTitle: true,
//   title: Text(
//     'Store',
//     style: TextStyle(color: Colors.black),
//   ),
//   backgroundColor: Colors.yellow,
//   actions: <Widget>[
//     IconButton(
//         icon: Icon(
//           Icons.shopping_cart,
//           color: Colors.white,
//         ),
//         onPressed: () => Navigator.pushNamed(context, '/cart'))
//   ],
// );

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  HomeAppBar({Key key, this.title, this.color})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0
  final String title;
  final Color color;

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      title: Text(
        widget.title,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: widget.color,
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartScreen())))
      ],
    );
  }
}
