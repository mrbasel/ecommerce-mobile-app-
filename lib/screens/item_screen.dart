import 'package:flutter/material.dart';

import 'package:ecom_app/models/models.dart';
import 'package:ecom_app/services/firestore.dart';
import 'package:ecom_app/widgets/snackbars.dart';
import 'package:ecom_app/widgets/appbars/home_appbar.dart';

class ItemScreen extends StatelessWidget {
  final Item item;
  final Widget largeButton;
  final Widget smallButton;

  ItemScreen({this.item, this.largeButton, this.smallButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MainAppBar(
          title: 'item',
          color: Colors.transparent,
          showCart: false,
          elevation: 0.0,
        ),
        body: Container(
          child: Stack(children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Image.network(item.imgUrl),
                        width: 200,
                        margin: EdgeInsets.all(20),
                      ),

                      // Item Title
                      Text(
                        item.name,
                        style: TextStyle(fontSize: 25, color: Colors.grey[600]),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      // Item Price
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item.price,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),

                      Container(
                        margin: EdgeInsets.only(bottom: 80, top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Text('Description', style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                            Text(
                                'Mit dem antizyklischen Kapitalpolster sollen die Kapitalanforderungen für den Bankensektor das globale Finanzumfeld'),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            Positioned(
              child: Builder(
                builder: (context) =>
                    largeButton ??
                    FlatButton(
                        child: Text(
                          'Add To My Cart',
                          style: TextStyle(color: Colors.white),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        color: Colors.blue[800],
                        onPressed: () async{
                          addItem(item);
                          Scaffold.of(context).showSnackBar(addItemSnackBar);
                        }),
              ),
              bottom: 3,
              right: 5,
              left: 5,
              // right: 200,
            ),
          ]),
        ));
  }
}
