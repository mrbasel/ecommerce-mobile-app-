import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:ecom_app/widgets/appbars/home_appbar.dart';
import 'package:ecom_app/widgets/drawers/main_drawer.dart';
import 'package:ecom_app/widgets/item_card.dart';
import 'package:ecom_app/models/data.dart';

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
                    autoPlay: true, autoPlayInterval: Duration(seconds: 4)),
                items: [
                  Image.network(
                      'https://images.unsplash.com/photo-1527264935190-1401c51b5bbc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
                  Image.network(
                    'https://images.unsplash.com/photo-1526178613552-2b45c6c302f0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
                  ),
                ]),
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, int index) {
                    return ItemCard(
                      showCart: true,
                      item: items[index],
                      trailingWidget: SizedBox(
                        width: 20.0,
                        height: 20.0,
                      ),
                    );
                  }),
              margin: EdgeInsets.only(top: 60),
            )
          ],
        ));
  }
}
