import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecom_app/services/auth.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(children: [
        ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    radius: 40,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        email,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ))
                ],
              ),
              decoration: BoxDecoration(color: Colors.grey[100]),
            ),
            ListTile(
              title: Text('Clothes'),
              trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  onPressed: null  ),
                  onTap: () async{
                    // QuerySnapshot querySnapshots = await Firestore.instance.collection("users").getDocuments();
                    // for (DocumentSnapshot doc in querySnapshots.documents) {
                    //   print(doc.data['name']);
                    // }
                    // var user = await FirebaseAuth.instance.us;
                    // print(user.displayName);
                  },
            ),
            Divider(
              height: 8,
            ),
            ListTile(
              title: Text('Electronies'),
              trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  onPressed: null),
            ),
            Divider(
              height: 8,
            ),
            ListTile(
              title: Text('Groceies'),
              trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  onPressed: null),
            ),
            Divider(
              height: 8,
            ),
            ListTile(
              title: Text('Fitness & Gym'),
              trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  onPressed: null),
            ),
            Divider(
              height: 8,
            ),
            ListTile(
              title: Text('Books'),
              trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  onPressed: null),
            ),
            Divider(
              height: 8,
            )
          ],
        ),
        Positioned(
          child: MaterialButton(
            child: Text('Logout'),
            color: Colors.red,
            textColor: Colors.white,
            animationDuration: Duration(seconds: 5),

            onPressed: () async {
              signOutGoogle();
              var user = await FirebaseAuth.instance.currentUser();
              print(user.displayName);
              // Navigator.pop(context);
              Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
            },
          ),
          bottom: 0,
          left: 35,
          right: 35
          )
      ]),
    );
  }
}
