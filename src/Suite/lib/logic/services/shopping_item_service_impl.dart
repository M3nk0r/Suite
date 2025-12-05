import 'package:suite/cross_cutting/entities/shopping_item.dart';
import 'package:suite/data/db_context.dart';
import 'package:suite/logic/services/interfaces/shopping_item_service.dart';

class ShoppingItemServiceImpl extends ShoppingItemService {
  final DbContext context;

  ShoppingItemServiceImpl({required this.context});

  @override
  Future<void> create(ShoppingItem entity) async {
    final db = await context.open();

    var map = entity.toMap();
    await db.insert(ShoppingItem.dbName, map);
    await db.close();
  }

  @override
  Future<void> delete(ShoppingItem entity) async {
    final db = await context.open();

    await db.delete(
      ShoppingItem.dbName,
      where: 'id = ? and userId = ?',
      whereArgs: [entity.id, entity.userId],
    );

    await db.close();
  }

  @override
  Future<List<ShoppingItem>> read() async {
    final db = await context.open();

    final List<Map<String, Object?>> maps = await db.query(ShoppingItem.dbName);

    await db.close();

    return [for (final map in maps) ShoppingItem.fromMap(map)];
  }

  @override
  Future<void> update(ShoppingItem entity) async {
    final db = await context.open();

    await db.update(
      ShoppingItem.dbName,
      entity.toMap(),
      where: 'id = ? and userId = ?',
      whereArgs: [entity.id, entity.userId],
    );

    await db.close();
  }
}
