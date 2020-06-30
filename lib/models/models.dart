

class Item {
  String id;
  String name;
  dynamic price;
  String imgUrl;

  Item({this.name, this.price, this.imgUrl, this.id});
}


class User {
  String email;
  String name;

  User({this.name, this.email});
}