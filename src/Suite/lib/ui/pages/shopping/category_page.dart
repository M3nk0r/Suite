import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/cross_cutting/entities/category.dart';
import 'package:suite/injection.dart';
import 'package:suite/ui/controllers/category/category_cubit.dart';
import 'package:suite/ui/controllers/category/category_state.dart';

@RoutePage()
class CategoryPage extends StatelessWidget {
  final Category? category;

  const CategoryPage({this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoryCubit>()..init(category),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('Category')),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    initialValue: state.name,
                    onChanged: (value) =>
                        context.read<CategoryCubit>().onChangeName(value),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Color'),
                    initialValue: state.color,
                    onChanged: (value) =>
                        context.read<CategoryCubit>().onChangeColor(value),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      await context.read<CategoryCubit>().addOrUpdate();

                      if (context.mounted) {
                        context.router.pop();
                      }
                    },
                    child: Text('Save'),
                  ),
                  Visibility(
                    visible: state.oldCategory != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () async {
                            await context.read<CategoryCubit>().delete();

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
