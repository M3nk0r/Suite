import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/injection.dart';
import 'package:suite/ui/controllers/category/category_cubit.dart';
import 'package:suite/ui/controllers/category/category_state.dart';

@RoutePage()
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoryCubit>(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Category'),
              ),
            );
          }
      ),
    );
  }
}
