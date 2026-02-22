import 'package:suite/cross_cutting/entities/shopping_list.dart';

class ShoppingState {
  final List<ShoppingList> shoppingLists;

  ShoppingState({required this.shoppingLists});

  ShoppingState copyWith({final List<ShoppingList>? shoppingLists,}) {
    return ShoppingState(shoppingLists: shoppingLists ?? this.shoppingLists,);
  }
}