class Item {
  String title;
  int id;
  int price = 0;

  Item({
    required this.title,
    required this.id,
    required this.price,
  });

  //converting Item objects to Maps to save and load from box otherwise there'd be an error
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'price' : price
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      title: map['title'],
      id: map['id'],
      price: map['price']
    );
  }

  @override
  bool operator ==(Object other) =>
      other is Item && other.runtimeType == runtimeType && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
