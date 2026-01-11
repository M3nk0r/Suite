import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/injection.dart';
import 'package:suite/ui/controllers/shopping_item_overview/shopping_item_overview_cubit.dart';
import 'package:suite/ui/controllers/shopping_item_overview/shopping_item_overview_state.dart';
import 'package:suite/ui/router.gr.dart';

@RoutePage()
class ShoppingItemOverviewPage extends StatelessWidget {
  const ShoppingItemOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ShoppingItemOverviewCubit>()..init(),
      child: BlocBuilder<ShoppingItemOverviewCubit, ShoppingItemOverviewState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('Shopping items')),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await context.router.push(ShoppingItemRoute(shoppingItem: null));

                if (context.mounted) {
                  await context.read<ShoppingItemOverviewCubit>().refresh();
                }
              },
              child: Icon(Icons.add),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: state.shoppingItems.length,
                itemBuilder: (context, index) {
                  final shoppingItem = state.shoppingItems[index];
                  return ListTile(
                    title: Text(shoppingItem.name),
                    onTap: () async {
                      await context.router.push(
                        ShoppingItemRoute(shoppingItem: shoppingItem),
                      );

                      if (context.mounted) {
                        await context.read<ShoppingItemOverviewCubit>().refresh();
                      }
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}