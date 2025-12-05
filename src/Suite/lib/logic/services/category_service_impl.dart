import 'package:suite/cross_cutting/entities/category.dart';
import 'package:suite/data/db_context.dart';
import 'package:suite/logic/services/interfaces/category_service.dart';

class CategoryServiceImpl extends CategoryService {
  final DbContext context;

  CategoryServiceImpl({required this.context});

  @override
  Future<void> create(Category entity) async {
    final db = await context.open();

    var map = entity.toMap();
    await db.insert(Category.dbName, map);
    await db.close();
  }

  @override
  Future<void> delete(Category entity) async {
    final db = await context.open();

    await db.delete(
      Category.dbName,
      where: 'id = ? and userId = ?',
      whereArgs: [entity.id, entity.userId],
    );

    await db.close();
  }

  @override
  Future<List<Category>> read() async {
    final db = await context.open();

    final List<Map<String, Object?>> maps = await db.query(Category.dbName);

    await db.close();

    return [for (final map in maps) Category.fromMap(map)];
  }

  @override
  Future<void> update(Category entity) async {
    final db = await context.open();

    await db.update(
      Category.dbName,
      entity.toMap(),
      where: 'id = ? and userId = ?',
      whereArgs: [entity.id, entity.userId],
    );

    await db.close();
  }
}
