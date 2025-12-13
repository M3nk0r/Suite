import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/injection.dart';
import 'package:suite/ui/controllers/shopping/shopping_cubit.dart';
import 'package:suite/ui/controllers/shopping/shopping_state.dart';
import 'package:suite/ui/pages/shopping/shopping_list_page.dart';
import 'package:suite/ui/router.gr.dart';
import 'package:suite/ui/widgets/circle_button.dart';
import 'package:suite/ui/widgets/expandable_fab.dart';

@RoutePage()
class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => sl<ShoppingCubit>(),
      child: BlocBuilder<ShoppingCubit, ShoppingState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: ExpandableFab(
              icon: Icon(Icons.add),
              distance: 110,
              children: [
                CircleButton(
                  size: 64,
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: theme.colorScheme.onPrimary,
                  ),
                  text: Text(
                    'Add Item',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  containerColor: theme.colorScheme.primaryContainer,
                  onTap: () => context.router.push(ShoppingItemRoute()),
                ),
                CircleButton(
                  size: 64,
                  icon: Icon(Icons.receipt, color: theme.colorScheme.onPrimary),
                  text: Text(
                    'Add list',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  containerColor: theme.colorScheme.primaryContainer,
                  onTap: () => context.router.push(ShoppingListRoute()),
                ),
                CircleButton(
                  size: 64,
                  icon: Icon(Icons.add, color: theme.colorScheme.onPrimary),
                  text: Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  containerColor: theme.colorScheme.primaryContainer,
                  onTap: () => context.router.push(CategoryOverviewRoute()),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(children: []),
              ),
            ),
          );
        },
      ),
    );
  }
}
