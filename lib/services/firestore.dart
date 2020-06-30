import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:ecom_app/models/models.dart';

// TODO: move functions to one class

void addUser(user){
  Firestore.instance.runTransaction((transaction) async {
    CollectionReference reference = Firestore.instance.collection('users');
    Map<String, dynamic> documentData = {
      'name': user.name,
      'email': user.email,
    };
    await reference.document(user.email).setData(documentData);
  });
}

void addItem(Item item){
  Firestore.instance.runTransaction((transaction) async {
    // Current logged in user
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    CollectionReference reference = Firestore.instance.collection('users').document(user.email).collection('items');

    Map<String, dynamic> document = {
      'id': item.name,
      'name': item.name,
      'price': item.price,
      'imgUrl': item.imgUrl
    };
    await reference.add(document);
  });
}

void deleteItem(String documentId){
  Firestore.instance.runTransaction((transaction) async {
  
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  CollectionReference reference = Firestore.instance.collection('users').document(user.email).collection('items');

  await reference.document(documentId).delete();

  });
}