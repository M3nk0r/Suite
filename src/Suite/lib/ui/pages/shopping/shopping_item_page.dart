import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/injection.dart';
import 'package:suite/ui/controllers/shopping_item/shopping_item_cubit.dart';
import 'package:suite/ui/controllers/shopping_item/shopping_item_state.dart';

@RoutePage()
class ShoppingItemPage extends StatelessWidget {
  const ShoppingItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ShoppingItemCubit>(),
      child: BlocBuilder<ShoppingItemCubit, ShoppingItemState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Item'),
              ),
            );
          }
      ),
    );
  }
}
