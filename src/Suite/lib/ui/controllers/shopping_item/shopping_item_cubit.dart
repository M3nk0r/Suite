import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/cross_cutting/entities/category.dart';
import 'package:suite/cross_cutting/entities/shopping_item.dart';
import 'package:suite/logic/services/interfaces/category_service.dart';
import 'package:suite/logic/services/interfaces/shopping_item_service.dart';
import 'package:suite/ui/controllers/shopping_item/shopping_item_state.dart';

class ShoppingItemCubit extends Cubit<ShoppingItemState> {
  final ShoppingItemService shoppingItemService;
  final CategoryService categoryService;

  ShoppingItemCubit({
    required this.shoppingItemService,
    required this.categoryService,
  }) : super(
         ShoppingItemState(
           oldShoppingItem: null,
           selectedCategory: null,
           name: '',
           categories: [],
         ),
       );

  Future<void> init(ShoppingItem? oldShoppingItem) async {
    if (oldShoppingItem != null) {
      emit(
        state.copyWith(
          oldShoppingItem: oldShoppingItem,
          name: oldShoppingItem.name,
        ),
      );
    }

    final categories = await categoryService.read();
    emit(
      state.copyWith(
        categories: categories,
        selectedCategory: categories.first,
      ),
    );

    if (oldShoppingItem != null) {
      final category = categories
          .where(
            (x) =>
                x.id == oldShoppingItem.categoryId &&
                x.userId == oldShoppingItem.categoryUserId,
          )
          .first;

      emit(
        state.copyWith(
          selectedCategory: category,
        ),
      );
    }
  }

  Future<void> addOrUpdate() async {
    if (state.selectedCategory == null) {
      return;
    }

    if (state.oldShoppingItem != null) {
      await update();
    } else {
      await add();
    }
  }

  Future<void> add() async {
    final shoppingItem = ShoppingItem.create(
      userId: '',
      name: state.name,
      categoryId: state.selectedCategory!.id,
      categoryUserId: state.selectedCategory!.userId,
    );

    await shoppingItemService.create(shoppingItem);
  }

  Future<void> update() async {
    final shoppingItem = ShoppingItem(
      id: state.oldShoppingItem!.id,
      userId: state.oldShoppingItem!.userId,
      name: state.name,
      categoryId: state.selectedCategory!.id,
      categoryUserId: state.selectedCategory!.userId,
    );

    await shoppingItemService.update(shoppingItem);
  }

  Future<void> delete() async {
    if(state.oldShoppingItem == null){
      return;
    }
    
    await shoppingItemService.delete(state.oldShoppingItem!);

  }

  void onChangeName(String value) => emit(state.copyWith(name: value));

  void onSelectCategory(Category? value) =>
      emit(state.copyWith(selectedCategory: value));
}
