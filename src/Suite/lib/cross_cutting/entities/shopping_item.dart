class ShoppingItem {
  final String id;
  final String userId;
  final String name;
  final String categoryId;

  ShoppingItem({
    required this.id,
    required this.userId,
    required this.name,
    required this.categoryId,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'userId': userId, 'name': name, 'categoryId': categoryId};
  }

  factory ShoppingItem.fromMap(Map<String, dynamic> map) {
    return ShoppingItem(
      id: map['id'] as String,
      userId: map['userId'] as String,
      name: map['name'] as String,
      categoryId: map['categoryId'] as String,
    );
  }
}
