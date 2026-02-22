class ShoppingListItemView {
  final String shoppingListId;
  final String shoppingItemId;
  final int count;
  final String? note;
  final bool bought;
  final String name;
  final String category;
  final String categoryColor;

  static const dbName = 'ShoppingListItemView';

  ShoppingListItemView({
    required this.shoppingListId,
    required this.shoppingItemId,
    required this.count,
    required this.note,
    required this.bought,
    required this.name,
    required this.category,
    required this.categoryColor
  });

  Map<String, dynamic> toMap() {
    return {
      'shoppingListId': shoppingListId,
      'shoppingItemId': shoppingItemId,
      'count': count,
      'note': note,
      'bought': bought,
      'name': name,
      'category': category,
      'categoryColor': categoryColor
    };
  }

  factory ShoppingListItemView.fromMap(Map<String, dynamic> map) {
    return ShoppingListItemView(
      shoppingListId: map['shoppingListId'] as String,
      shoppingItemId: map['shoppingItemId'] as String,
      count: map['count'] as int,
      note: map['note'] as String?,
      bought: (map['bought'] as int) == 0 ? false : true,
      name: map['name'] as String,
      category: map['category'] as String,
      categoryColor: map['categoryColor'] as String,
    );
  }
}
