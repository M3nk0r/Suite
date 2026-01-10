import 'package:suite/cross_cutting/entities/shopping_item.dart';

class ShoppingItemOverviewState {
  final List<ShoppingItem> shoppingItems;

  ShoppingItemOverviewState({required this.shoppingItems});

  ShoppingItemOverviewState copyWith(
      {final List<ShoppingItem>? shoppingItems,}) {
    return ShoppingItemOverviewState(
      shoppingItems: shoppingItems ?? this.shoppingItems,);
  }


}