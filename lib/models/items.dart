class Item {
  int? id;
  String title;
  int? price; // Price is now optional
  bool isPurchased;

  Item({
    this.id,
    required this.title,
    this.price, // No longer required
    this.isPurchased = false,
  });
  //----------------Method to convert Items Object into Map---------------------
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemName': title,
      'Price': price,
      'isDone': isPurchased ? 1 : 0,
    };
  }

  //---------------Method to Convert Map into Object----------------------------
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      title: map['itemName'],
      price: map['Price'],
      isPurchased: map['isDone'] == 1
      );
  }
}
