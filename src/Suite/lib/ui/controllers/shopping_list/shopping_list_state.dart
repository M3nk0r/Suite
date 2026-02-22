import 'package:suite/cross_cutting/entities/shopping_item.dart';
import 'package:suite/cross_cutting/entities/shopping_list.dart';
import 'package:suite/cross_cutting/views/shopping_list_item_view.dart';

class ShoppingListState {
  final ShoppingList shoppingList;
  final List<ShoppingListItemView> shoppingListItems;

  ShoppingListState({required this.shoppingList, required this.shoppingListItems});


  ShoppingListState copyWith({final ShoppingList? shoppingList, final List<
      ShoppingListItemView>? shoppingListItems, final List<ShoppingItem>? searchResult}) {
    return ShoppingListState(shoppingList: shoppingList ?? this.shoppingList,
      shoppingListItems: shoppingListItems ?? this.shoppingListItems,);
  }

}