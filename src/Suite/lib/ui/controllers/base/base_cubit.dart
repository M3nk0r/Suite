import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/ui/controllers/base/base_state.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit()
    : super(BaseState(pageIndex: 0));

  void onBottomNavigationBarTap(int index) {
    emit(state.copyWith(pageIndex: index));
  }
}
