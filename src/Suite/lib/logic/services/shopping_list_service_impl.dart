import 'package:suite/cross_cutting/entities/shopping_list.dart';
import 'package:suite/data/db_context.dart';
import 'package:suite/logic/services/interfaces/shopping_list_service.dart';

class ShoppingListServiceImpl extends ShoppingListService {
  final DbContext context;

  ShoppingListServiceImpl({required this.context});

  @override
  Future<void> create(ShoppingList entity) async {
    final db = await context.open();

    var map = entity.toMap();
    await db.insert(ShoppingList.dbName, map);
    await db.close();
  }

  @override
  Future<void> delete(ShoppingList entity) async {
    final db = await context.open();

    await db.delete(
      ShoppingList.dbName,
      where: 'id = ? and userId = ?',
      whereArgs: [entity.id, entity.userId],
    );

    await db.close();
  }

  @override
  Future<List<ShoppingList>> read() async {
    final db = await context.open();

    final List<Map<String, Object?>> maps = await db.query(ShoppingList.dbName);

    await db.close();

    return [for (final map in maps) ShoppingList.fromMap(map)];
  }

  @override
  Future<void> update(ShoppingList entity) async {
    final db = await context.open();

    await db.update(
      ShoppingList.dbName,
      entity.toMap(),
      where: 'id = ? and userId = ?',
      whereArgs: [entity.id, entity.userId],
    );

    await db.close();
  }
}
