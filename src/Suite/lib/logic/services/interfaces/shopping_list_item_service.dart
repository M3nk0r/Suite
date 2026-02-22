import 'package:suite/cross_cutting/entities/shopping_list.dart';
import 'package:suite/cross_cutting/entities/shopping_list_item.dart';
import 'package:suite/cross_cutting/views/shopping_list_item_view.dart';
import 'package:suite/logic/interfaces/crud.dart';

abstract class ShoppingListItemService implements Crud<ShoppingListItem>{
  Future<List<ShoppingListItemView>> readViewByShoppingList(ShoppingList shoppingList);
}