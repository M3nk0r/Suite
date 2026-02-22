import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/cross_cutting/entities/shopping_list.dart';
import 'package:suite/injection.dart';
import 'package:suite/ui/controllers/shopping_list/shopping_list_cubit.dart';
import 'package:suite/ui/controllers/shopping_list/shopping_list_state.dart';

@RoutePage()
class ShoppingListPage extends StatelessWidget {
  final ShoppingList shoppingList;

  const ShoppingListPage({required this.shoppingList, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ShoppingListCubit>()..init(shoppingList),
      child: BlocBuilder<ShoppingListCubit, ShoppingListState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text(state.shoppingList.name)),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SearchAnchor(
                    builder: (searchContext, controller) {
                      return SearchBar(
                        controller: controller,
                        leading: const Icon(Icons.search),
                        onTap: () => controller.openView(),
                      );
                    },
                    suggestionsBuilder: (searchContext, controller) async {
                      final searchResult = await context
                          .read<ShoppingListCubit>()
                          .search(controller.text);
                      final list = searchResult
                          .map(
                            (shoppingItem) => ListTile(
                              title: Text(shoppingItem.name),
                              onTap: () => context
                                  .read<ShoppingListCubit>()
                                  .addItem(shoppingItem),
                            ),
                          )
                          .toList();
                      return list;
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.shoppingListItems.length,
                      itemBuilder: (context, index) {
                        final item = state.shoppingListItems[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text('${item.category} | Count: ${item.count}'),
                          leading: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () => context
                                .read<ShoppingListCubit>()
                                .removeItem(item),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () => context
                                    .read<ShoppingListCubit>()
                                    .decreaseCount(item),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () => context
                                    .read<ShoppingListCubit>()
                                    .increaseCount(item),
                              ),
                            ],
                          ),
                        );
                      },
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
