import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';

import 'package:ecom_app/widgets/item_card.dart';
import 'package:ecom_app/models/item.dart';
import 'package:ecom_app/services/firestore.dart';
import 'package:ecom_app/widgets/snackbars.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getTotal(total){
      final formatCurrency =  NumberFormat('#,###.00');
      var prices = total.map((i) => double.parse(i.replaceAll(RegExp(r'SAR'), '').replaceAll(RegExp(r','), '')));
      var sum = prices.reduce((a, b) => a + b);
      print(sum);
      return formatCurrency.format(sum);
      // return formatCurrency.format(2590.00);
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Cart', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('items').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                var total = snapshot.data.documents.map((i) => i.data['price']);
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return Stack(children: [
              ListView(
                children: <Widget>[
                  Container(
                    child: Text(
                      snapshot.data.documents.length == 0
                          ? 'Your cart is Empty.'
                          : 'Items',
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
                              onPressed: () {
                                deleteItem(item.id);
                                Navigator.pop(context);
                                Scaffold.of(context)
                                    .showSnackBar(deleteItemSnackBar);
                              }),
                        );
                      }),
                      SizedBox(height: 100,)
                ],
              ),
              Positioned(
                  child: Container(
                    color: Colors.grey[50],
                    padding: EdgeInsets.all(20),
                    child: FlatButton(

                      child: Text('Checkout Now (${getTotal(total)} SAR)', style: TextStyle(fontSize: 20, color: Colors.white),),
                      color: Colors.orange[600],
                      padding: EdgeInsets.all(20),
                      onPressed: () => print('click'),
                      ),
                  ),
                    bottom: 0,
                    right: 0,
                    left: 0,
                    )
            ]);
          }),
    );
  }
}
