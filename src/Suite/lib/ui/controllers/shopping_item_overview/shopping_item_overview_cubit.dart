import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/logic/services/interfaces/shopping_item_service.dart';
import 'package:suite/ui/controllers/shopping_item_overview/shopping_item_overview_state.dart';

class ShoppingItemOverviewCubit extends Cubit<ShoppingItemOverviewState>{

  final ShoppingItemService shoppingItemService;

  ShoppingItemOverviewCubit({required this.shoppingItemService}) : super(ShoppingItemOverviewState(shoppingItems: []));

  Future<void> init() async {
    final shoppingItems = await shoppingItemService.read();

    emit(state.copyWith(shoppingItems: shoppingItems));
  }

  Future<void> refresh() async {
    final shoppingItems = await shoppingItemService.read();

    emit(state.copyWith(shoppingItems: shoppingItems));
  }
}