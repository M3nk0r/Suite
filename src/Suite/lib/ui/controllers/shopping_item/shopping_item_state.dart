import 'package:suite/cross_cutting/entities/category.dart';
import 'package:suite/cross_cutting/entities/shopping_item.dart';

class ShoppingItemState {
  final ShoppingItem? oldShoppingItem;
  final String name;
  final Category? selectedCategory;
  final List<Category> categories;

  ShoppingItemState({
    required this.oldShoppingItem,
    required this.name,
    required this.selectedCategory,
    required this.categories
  });

  ShoppingItemState copyWith({
    final ShoppingItem? oldShoppingItem,
    final String? name,
    final Category? selectedCategory,
    final List<Category>? categories
  }) {
    return ShoppingItemState(
      oldShoppingItem: oldShoppingItem ?? this.oldShoppingItem,
      name: name ?? this.name,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      categories: categories ?? this.categories,
    );
  }
}
