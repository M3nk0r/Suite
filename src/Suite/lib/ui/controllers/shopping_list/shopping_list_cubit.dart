import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/cross_cutting/entities/shopping_item.dart';
import 'package:suite/cross_cutting/entities/shopping_list.dart';
import 'package:suite/cross_cutting/entities/shopping_list_item.dart';
import 'package:suite/cross_cutting/views/shopping_list_item_view.dart';
import 'package:suite/logic/services/interfaces/shopping_item_service.dart';
import 'package:suite/logic/services/interfaces/shopping_list_item_service.dart';
import 'package:suite/ui/controllers/shopping_list/shopping_list_state.dart';

class ShoppingListCubit extends Cubit<ShoppingListState> {
  final ShoppingListItemService shoppingListItemService;
  final ShoppingItemService shoppingItemService;

  ShoppingListCubit({
    required this.shoppingListItemService,
    required this.shoppingItemService,
  }) : super(
         ShoppingListState(
           shoppingList: ShoppingList(id: '', userId: '', name: ''),
           shoppingListItems: [],
         ),
       );

  Future<void> init(ShoppingList shoppingList) async {
    final itemList = await shoppingListItemService.readViewByShoppingList(
      shoppingList,
    );

    emit(
      state.copyWith(shoppingList: shoppingList, shoppingListItems: itemList),
    );
  }

  Future<List<ShoppingItem>> search(String search) async {
    return await shoppingItemService.readByName(search);
  }

  Future<void> addItem(ShoppingItem item) async {
    final sli = ShoppingListItem(
      shoppingListId: state.shoppingList.id,
      shoppingItemId: item.id,
      count: 1,
      note: '',
      bought: false,
    );
    await shoppingListItemService.create(sli);
    await _reloadShoppingListItems();
  }

  Future<void> removeItem(ShoppingListItemView item) async {
    final shoppingListItem = ShoppingListItem(
      shoppingListId: item.shoppingListId,
      shoppingItemId: item.shoppingItemId,
      count: item.count,
      note: item.note,
      bought: item.bought,
    );

    await shoppingListItemService.delete(shoppingListItem);
    await _reloadShoppingListItems();
  }

  Future<void> increaseCount(ShoppingListItemView item) async {
    final shoppingListItem = ShoppingListItem(
      shoppingListId: item.shoppingListId,
      shoppingItemId: item.shoppingItemId,
      count: item.count + 1,
      note: item.note,
      bought: item.bought,
    );

    await shoppingListItemService.update(shoppingListItem);

    await _reloadShoppingListItems();
  }

  Future<void> decreaseCount(ShoppingListItemView item) async {
    final shoppingListItem = ShoppingListItem(
      shoppingListId: item.shoppingListId,
      shoppingItemId: item.shoppingItemId,
      count: item.count == 1 ? 1 : item.count - 1,
      note: item.note,
      bought: item.bought,
    );

    await shoppingListItemService.update(shoppingListItem);

    await _reloadShoppingListItems();
  }

  Future<void> _reloadShoppingListItems() async {
    final list = await shoppingListItemService.readViewByShoppingList(
      state.shoppingList,
    );
    emit(state.copyWith(shoppingListItems: list));
  }
}
