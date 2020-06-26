import 'package:cloud_firestore/cloud_firestore.dart';

void addItem(item){
  Firestore.instance.runTransaction((transaction) async {
    CollectionReference reference = Firestore.instance.collection('items');
    Map<String, dynamic> document = {
      'name': item.name,
      'price': item.price,
      'imgUrl': item.imgUrl
    };
    await reference.add(document);
  });
}

void deleteItem(String documentId){
  Firestore.instance.runTransaction((transaction) async {
  CollectionReference reference = Firestore.instance.collection('items');

  await reference.document(documentId).delete();

  });
}