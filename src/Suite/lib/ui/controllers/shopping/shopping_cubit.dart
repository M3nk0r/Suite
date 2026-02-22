import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/cross_cutting/entities/shopping_list.dart';
import 'package:suite/logic/services/interfaces/shopping_list_service.dart';
import 'package:suite/ui/controllers/shopping/shopping_state.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  final ShoppingListService shoppingListService;

  ShoppingCubit({required this.shoppingListService}) : super(ShoppingState(shoppingLists: []));


  Future<void> init() async {
    await _reloadShoppingList();
  }

  Future<void> addShoppingList(String name) async {

    final shoppingList = ShoppingList(id: '', userId: '', name: name);

    await shoppingListService.create(shoppingList);

    await _reloadShoppingList();
  }

  Future<void> _reloadShoppingList() async {
    final shoppingLists = await shoppingListService.read();

    emit(state.copyWith(shoppingLists: shoppingLists));
  }
}
