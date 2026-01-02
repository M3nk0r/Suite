import 'package:suite/cross_cutting/entities/category.dart';

class CategoryState {
  final Category? oldCategory;
  final String name;
  final String color;

  CategoryState({
    required this.oldCategory,
    required this.name,
    required this.color,
  });

  CategoryState copyWith({Category? oldCategory, String? name, String? color}) {
    return CategoryState(
      oldCategory: oldCategory ?? this.oldCategory,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }
}
