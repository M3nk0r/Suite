class ShoppingListItem {
  final String shoppingListId;
  final String shoppingItemId;
  final int count;
  final String? note;
  final bool bought;

  ShoppingListItem({
    required this.shoppingListId,
    required this.shoppingItemId,
    required this.count,
    required this.note,
    required this.bought
  });

  Map<String, dynamic> toMap() {
    return {
      'shoppingListId': shoppingListId,
      'shoppingItemId': shoppingItemId,
      'count': count,
      'note': note,
      'bought': bought,
    };
  }

  factory ShoppingListItem.fromMap(Map<String, dynamic> map) {
    return ShoppingListItem(
      shoppingListId: map['shoppingListId'] as String,
      shoppingItemId: map['shoppingItemId'] as String,
      count: map['count'] as int,
      note: map['note'] as String?,
      bought: map['bought'] as bool,
    );
  }
}
