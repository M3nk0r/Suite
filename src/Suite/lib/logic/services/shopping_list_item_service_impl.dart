import 'package:suite/cross_cutting/entities/shopping_list.dart';
import 'package:suite/cross_cutting/entities/shopping_list_item.dart';
import 'package:suite/cross_cutting/views/shopping_list_item_view.dart';
import 'package:suite/data/db_context.dart';
import 'package:suite/logic/services/interfaces/shopping_list_item_service.dart';

class ShoppingListItemServiceImpl extends ShoppingListItemService {
  final DbContext context;

  ShoppingListItemServiceImpl({required this.context});

  @override
  Future<void> create(ShoppingListItem entity) async {
    final db = await context.open();

    var map = entity.toMap();
    await db.insert(ShoppingListItem.dbName, map);
    await db.close();
  }

  @override
  Future<void> delete(ShoppingListItem entity) async {
    final db = await context.open();

    await db.delete(
      ShoppingListItem.dbName,
      where: 'shoppingListId = ? and shoppingItemId = ?',
      whereArgs: [entity.shoppingListId, entity.shoppingItemId],
    );

    await db.close();
  }

  @override
  Future<List<ShoppingListItem>> read() async {
    final db = await context.open();

    final List<Map<String, Object?>> maps = await db.query(
      ShoppingListItem.dbName,
    );

    await db.close();

    return [for (final map in maps) ShoppingListItem.fromMap(map)];
  }

  @override
  Future<void> update(ShoppingListItem entity) async {
    final db = await context.open();

    await db.update(
      ShoppingListItem.dbName,
      entity.toMap(),
      where: 'shoppingListId = ? and shoppingItemId = ?',
      whereArgs: [entity.shoppingListId, entity.shoppingItemId],
    );

    await db.close();
  }

  @override
  Future<List<ShoppingListItemView>> readViewByShoppingList(
    ShoppingList shoppingList,
  ) async {
    final db = await context.open();

    final List<Map<String, Object?>> maps = await db.query(
      ShoppingListItemView.dbName,
      where: 'shoppingListId = ?',
      whereArgs: [shoppingList.id],
    );

    await db.close();

    return [for (final map in maps) ShoppingListItemView.fromMap(map)];
  }
}
