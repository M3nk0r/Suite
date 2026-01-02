import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/injection.dart';
import 'package:suite/ui/controllers/category_overview/category_overview_cubit.dart';
import 'package:suite/ui/controllers/category_overview/category_overview_state.dart';
import 'package:suite/ui/router.gr.dart';

@RoutePage()
class CategoryOverviewPage extends StatelessWidget {
  const CategoryOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoryOverviewCubit>()..init(),
      child: BlocBuilder<CategoryOverviewCubit, CategoryOverviewState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('Category')),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await context.router.push(CategoryRoute());

                if (context.mounted) {
                  await context.read<CategoryOverviewCubit>().refresh();
                }
              },
              child: Icon(Icons.add),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final category = state.categories[index];
                  return ListTile(
                    title: Text(category.name),
                    onTap: () async {
                      await context.router.push(
                        CategoryRoute(category: category),
                      );

                      if (context.mounted) {
                        await context.read<CategoryOverviewCubit>().refresh();
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
