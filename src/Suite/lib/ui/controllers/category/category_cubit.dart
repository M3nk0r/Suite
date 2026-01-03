import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/cross_cutting/entities/category.dart';
import 'package:suite/logic/services/interfaces/category_service.dart';
import 'package:suite/ui/controllers/category/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryService categoryService;

  CategoryCubit({required this.categoryService})
    : super(CategoryState(oldCategory: null, name: '', color: ''));

  void init(Category? category) {
    if (category != null) {
      emit(
        state.copyWith(
          oldCategory: category,
          name: category.name,
          color: category.color,
        ),
      );
    }
  }

  Future<void> addOrUpdate() async {
    if (state.oldCategory != null) {
      await update();
    } else {
      await add();
    }
  }

  Future<void> delete() async {
    if(state.oldCategory == null){
      return;
    }

    await categoryService.delete(state.oldCategory!);
  }

  Future<void> add() async {
    final category = Category.create(
      userId: '',
      name: state.name,
      color: state.color,
    );

    categoryService.create(category);
  }

  Future<void> update() async {
    final category = Category(
      id: state.oldCategory!.id,
      userId: state.oldCategory!.userId,
      name: state.name,
      color: state.color,
    );

    categoryService.update(category);
  }

  void onChangeName(String value) => emit(state.copyWith(name: value));

  void onChangeColor(String value) => emit(state.copyWith(color: value));
}
