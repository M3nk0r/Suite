import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/cross_cutting/entities/category.dart';
import 'package:suite/cross_cutting/entities/shopping_item.dart';
import 'package:suite/injection.dart';
import 'package:suite/ui/controllers/shopping_item/shopping_item_cubit.dart';
import 'package:suite/ui/controllers/shopping_item/shopping_item_state.dart';

@RoutePage()
class ShoppingItemPage extends StatelessWidget {
  final ShoppingItem? shoppingItem;

  const ShoppingItemPage({required this.shoppingItem, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ShoppingItemCubit>()..init(shoppingItem),
      child: BlocBuilder<ShoppingItemCubit, ShoppingItemState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('Item')),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    initialValue: state.name,
                    onChanged: (value) =>
                        context.read<ShoppingItemCubit>().onChangeName(value),
                  ),
                  const SizedBox(height: 16),
                  DropdownMenu<Category>(
                    label: Text('Category'),
                    expandedInsets: EdgeInsets.zero,
                    initialSelection: state.selectedCategory,
                    onSelected: (value) => context
                        .read<ShoppingItemCubit>()
                        .onSelectCategory(value),
                    dropdownMenuEntries: [
                      for (final category in state.categories)
                        DropdownMenuEntry<Category>(
                          value: category,
                          label: category.name,
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      await context.read<ShoppingItemCubit>().addOrUpdate();

                      if (context.mounted) {
                        context.router.pop();
                      }
                    },
                    child: Text('Save'),
                  ),
                  Visibility(
                    visible: state.oldShoppingItem != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () async {
                            await context.read<ShoppingItemCubit>().delete();

                            if (context.mounted) {
                              context.router.pop();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.errorContainer,
                          ),
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
