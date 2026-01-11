import 'package:uuid/uuid.dart';

class ShoppingItem {
  final String id;
  final String userId;
  final String name;
  final String categoryId;
  final String categoryUserId;

  static const dbName = 'ShoppingItem';

  ShoppingItem({
    required this.id,
    required this.userId,
    required this.name,
    required this.categoryId,
    required this.categoryUserId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'categoryId': categoryId,
      'categoryUserId': categoryUserId,
    };
  }

  factory ShoppingItem.fromMap(Map<String, dynamic> map) {
    return ShoppingItem(
      id: map['id'] as String,
      userId: map['userId'] as String,
      name: map['name'] as String,
      categoryId: map['categoryId'] as String,
      categoryUserId: map['categoryUserId'] as String,
    );
  }

  factory ShoppingItem.create({
    required userId,
    required name,
    required categoryId,
    required categoryUserId,
  }) {
    return ShoppingItem(
      id: Uuid().v8(),
      userId: userId,
      name: name,
      categoryId: categoryId,
      categoryUserId: categoryUserId,
    );
  }
}
