import 'package:carousel_slider/carousel_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:ecom_app/widgets/appbars/home_appbar.dart';
import 'package:ecom_app/widgets/drawers/main_drawer.dart';
import 'package:ecom_app/widgets/item_card.dart';
import 'package:ecom_app/models/models.dart';


class Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
          title: 'Store',
          color: Colors.yellow,
        ),
        drawer: MainDrawer(),
        body: ListView(
          children: <Widget>[
            CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2.4,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                    autoPlay: true, autoPlayInterval: Duration(seconds: 4)),
                items: [
                  Image.network(
                      'https://images-eu.ssl-images-amazon.com/images/G/40/Gateway/Sunrise/CE/XCM_Manual_Lenovo_A7_750x375_en_411656cf-7355-4ad6-b08f-cf6cd0b541e0.jpg'),
                  Image.network(
                    'https://images-eu.ssl-images-amazon.com/images/G/40/Gateway/Sunrise/CE/Samaung_S10_750x375_en-F.jpg',
                  ),
                ]),
            Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('items').snapshots(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, int index) {
                        return ItemCard(
                          showCart: true,
                          item: Item(
                           name:  snapshot.data.documents[index].data['name'],
                           imgUrl: snapshot.data.documents[index].data['imgUrl'],
                           price: snapshot.data.documents[index].data['price']
                          ),
                          trailingWidget: SizedBox(
                            width: 20.0,
                            height: 20.0,
                          ),
                        );
                      });
                }
              ),
              margin: EdgeInsets.only(top: 60),
            )
          ],
        ));
  }
}
