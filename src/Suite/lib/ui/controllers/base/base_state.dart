class BaseState {
  final int pageIndex;

  BaseState({
    required this.pageIndex,
  });

  BaseState copyWith({int? pageIndex}) {
    return BaseState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}
