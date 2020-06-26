import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecom_app/widgets/item_card.dart';
import 'package:ecom_app/models/item.dart';
import 'package:ecom_app/services/firestore.dart';

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
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return ListView(
              children: <Widget>[
                Container(
                  child: Text(
                    snapshot.data.documents.length == 0 ? 'Your cart is Empty.' : 'Items',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                          id: documents[index].documentID,
                          name: documents[index].data['name'].toString(),
                          price: documents[index].data['price'].toString(),
                          imgUrl: documents[index].data['imgUrl'].toString());
                      return ItemCard(
                        item: item,
                        largeButton: FlatButton(
                            child: Text(
                              'Remove from Cart',
                              style: TextStyle(color: Colors.white),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            color: Colors.blue[800],
                            onPressed: (){
                              deleteItem(item.id);
                              Navigator.pop(context);
                            }
                            ),
                      );
                    }),
              ],
            );
          }),
    );
  }
}
