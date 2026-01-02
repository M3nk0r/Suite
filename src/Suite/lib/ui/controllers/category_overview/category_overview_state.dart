import 'package:suite/cross_cutting/entities/category.dart';

class CategoryOverviewState {

  List<Category> categories;

  CategoryOverviewState({required this.categories});

  CategoryOverviewState copyWith({List<Category>? categories,}) {
    return CategoryOverviewState(categories: categories ?? this.categories,);
  }


}