class ShoppingList {
  final String id;
  final String userId;
  final String name;

  static const dbName = 'ShoppingList';

  ShoppingList({required this.id, required this.userId, required this.name});

  Map<String, dynamic> toMap() {
    return {'id': id, 'userId': userId, 'name': name};
  }

  factory ShoppingList.fromMap(Map<String, dynamic> map) {
    return ShoppingList(
      id: map['id'] as String,
      userId: map['userId'] as String,
      name: map['name'] as String,
    );
  }
}
