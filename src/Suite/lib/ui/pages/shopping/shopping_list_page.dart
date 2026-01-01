import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/injection.dart';
import 'package:suite/ui/controllers/shopping_list/shopping_list_cubit.dart';
import 'package:suite/ui/controllers/shopping_list/shopping_list_state.dart';

@RoutePage()
class ShoppingListPage extends StatelessWidget {
  const ShoppingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ShoppingListCubit>(),
      child: BlocBuilder<ShoppingListCubit, ShoppingListState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Shopping list'),
              ),
            );
          }
      ),
    );
  }
}
