import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/ui/controllers/shopping_list/shopping_list_state.dart';

class ShoppingListCubit extends Cubit<ShoppingListState> {
  ShoppingListCubit() : super(ShoppingListState());
}
