import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecom_app/widgets/item_card.dart';
import 'package:ecom_app/models/item.dart';


class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Firestore.instance.collection('items'));
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          return ListView(
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
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, int index) {
                        var documents = snapshot.data.documents;

                        Item item = Item(
                          name: documents[index].data['name'].toString(),
                          price: documents[index].data['price'].toString(),
                          imgUrl: documents[index].data['imgUrl'].toString()
                        );
                        return ItemCard(item: item);
                      }),
                ],
              );
        }
        ),
      // body: Container(
      //   child: items == null
      //       ? Align(
      //           alignment: Alignment(0, -0.7),
      //           child: Text(
      //             'Your cart is empty',
      //             style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //           ))
      //       : ListView(
      //           children: <Widget>[
      //             Container(
      //               child: Text(
      //                 'Items',
      //                 textAlign: TextAlign.center,
      //                 style:
      //                     TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //               ),
      //               margin: EdgeInsets.all(30),
      //             ),
      //             ListView.builder(
      //                 shrinkWrap: true,
      //                 physics: const ClampingScrollPhysics(),
      //                 itemCount: items.length,
      //                 itemBuilder: (context, int index) {
      //                   return ItemCard(item: items[index]);
      //                 }),
      //           ],
      //         ),
        // margin: EdgeInsets.all(40),
      );
  }
}
