import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/logic/services/interfaces/category_service.dart';
import 'package:suite/ui/controllers/category_overview/category_overview_state.dart';

class CategoryOverviewCubit extends Cubit<CategoryOverviewState> {
  final CategoryService categoryService;

  CategoryOverviewCubit({required this.categoryService})
    : super(CategoryOverviewState(categories: []));

  Future<void> init() async {
    final categories = await categoryService.read();
    emit(state.copyWith(categories: categories));
  }

  Future<void> refresh() async {
    final categories = await categoryService.read();
    emit(state.copyWith(categories: categories));
  }
}
