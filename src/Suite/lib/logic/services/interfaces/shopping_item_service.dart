import 'package:suite/cross_cutting/entities/shopping_item.dart';
import 'package:suite/logic/interfaces/crud.dart';

abstract class ShoppingItemService implements Crud<ShoppingItem>{
  Future<List<ShoppingItem>> readByName(String name);
}