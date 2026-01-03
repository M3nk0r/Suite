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
    final categories = await categoryService.read();
    emit(state.copyWith(categories: categories));

    if (oldShoppingItem != null) {
      final category = categories.where(
        (x) =>
            x.id == oldShoppingItem.categoryId &&
            x.userId == oldShoppingItem.categoryUserId,
      ).first;
      emit(
        state.copyWith(
          oldShoppingItem: oldShoppingItem,
          name: oldShoppingItem.name,
          selectedCategory: category
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
      id: state.oldShoppingItem!.userId,
      userId: state.oldShoppingItem!.userId,
      name: state.name,
      categoryId: state.selectedCategory!.id,
      categoryUserId: state.selectedCategory!.userId,
    );

    await shoppingItemService.update(shoppingItem);
  }

  void onChangeName(String value) => emit(state.copyWith(name: value));

  void onSelectCategory(Category value) {}
}
