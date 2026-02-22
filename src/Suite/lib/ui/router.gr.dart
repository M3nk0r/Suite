// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i18;
import 'package:suite/cross_cutting/entities/category.dart' as _i19;
import 'package:suite/cross_cutting/entities/room.dart' as _i17;
import 'package:suite/cross_cutting/entities/shopping_item.dart' as _i20;
import 'package:suite/cross_cutting/entities/shopping_list.dart' as _i21;
import 'package:suite/cross_cutting/entities/task.dart' as _i22;
import 'package:suite/ui/pages/add_task_page.dart' as _i1;
import 'package:suite/ui/pages/base_page.dart' as _i2;
import 'package:suite/ui/pages/home_page.dart' as _i5;
import 'package:suite/ui/pages/option/impressum_page.dart' as _i6;
import 'package:suite/ui/pages/option/packages_page.dart' as _i8;
import 'package:suite/ui/pages/option_page.dart' as _i7;
import 'package:suite/ui/pages/room_detail_page.dart' as _i9;
import 'package:suite/ui/pages/room_overview_page.dart' as _i10;
import 'package:suite/ui/pages/shopping/category_overview_page.dart' as _i3;
import 'package:suite/ui/pages/shopping/category_page.dart' as _i4;
import 'package:suite/ui/pages/shopping/shopping_item_overview_page.dart'
    as _i11;
import 'package:suite/ui/pages/shopping/shopping_item_page.dart' as _i12;
import 'package:suite/ui/pages/shopping/shopping_list_page.dart' as _i13;
import 'package:suite/ui/pages/shopping_page.dart' as _i14;
import 'package:suite/ui/pages/task_detail_page.dart' as _i15;

/// generated route for
/// [_i1.AddTaskPage]
class AddTaskRoute extends _i16.PageRouteInfo<AddTaskRouteArgs> {
  AddTaskRoute({
    required _i17.Room room,
    _i18.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         AddTaskRoute.name,
         args: AddTaskRouteArgs(room: room, key: key),
         initialChildren: children,
       );

  static const String name = 'AddTaskRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddTaskRouteArgs>();
      return _i1.AddTaskPage(room: args.room, key: args.key);
    },
  );
}

class AddTaskRouteArgs {
  const AddTaskRouteArgs({required this.room, this.key});

  final _i17.Room room;

  final _i18.Key? key;

  @override
  String toString() {
    return 'AddTaskRouteArgs{room: $room, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AddTaskRouteArgs) return false;
    return room == other.room && key == other.key;
  }

  @override
  int get hashCode => room.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i2.BasePage]
class BaseRoute extends _i16.PageRouteInfo<void> {
  const BaseRoute({List<_i16.PageRouteInfo>? children})
    : super(BaseRoute.name, initialChildren: children);

  static const String name = 'BaseRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i2.BasePage();
    },
  );
}

/// generated route for
/// [_i3.CategoryOverviewPage]
class CategoryOverviewRoute extends _i16.PageRouteInfo<void> {
  const CategoryOverviewRoute({List<_i16.PageRouteInfo>? children})
    : super(CategoryOverviewRoute.name, initialChildren: children);

  static const String name = 'CategoryOverviewRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.CategoryOverviewPage();
    },
  );
}

/// generated route for
/// [_i4.CategoryPage]
class CategoryRoute extends _i16.PageRouteInfo<CategoryRouteArgs> {
  CategoryRoute({
    _i19.Category? category,
    _i18.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         CategoryRoute.name,
         args: CategoryRouteArgs(category: category, key: key),
         initialChildren: children,
       );

  static const String name = 'CategoryRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoryRouteArgs>(
        orElse: () => const CategoryRouteArgs(),
      );
      return _i4.CategoryPage(category: args.category, key: args.key);
    },
  );
}

class CategoryRouteArgs {
  const CategoryRouteArgs({this.category, this.key});

  final _i19.Category? category;

  final _i18.Key? key;

  @override
  String toString() {
    return 'CategoryRouteArgs{category: $category, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CategoryRouteArgs) return false;
    return category == other.category && key == other.key;
  }

  @override
  int get hashCode => category.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomePage();
    },
  );
}

/// generated route for
/// [_i6.ImpressumPage]
class ImpressumRoute extends _i16.PageRouteInfo<void> {
  const ImpressumRoute({List<_i16.PageRouteInfo>? children})
    : super(ImpressumRoute.name, initialChildren: children);

  static const String name = 'ImpressumRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i6.ImpressumPage();
    },
  );
}

/// generated route for
/// [_i7.OptionPage]
class OptionRoute extends _i16.PageRouteInfo<void> {
  const OptionRoute({List<_i16.PageRouteInfo>? children})
    : super(OptionRoute.name, initialChildren: children);

  static const String name = 'OptionRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i7.OptionPage();
    },
  );
}

/// generated route for
/// [_i8.PackagesPage]
class PackagesRoute extends _i16.PageRouteInfo<PackagesRouteArgs> {
  PackagesRoute({_i18.Key? key, List<_i16.PageRouteInfo>? children})
    : super(
        PackagesRoute.name,
        args: PackagesRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'PackagesRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PackagesRouteArgs>(
        orElse: () => const PackagesRouteArgs(),
      );
      return _i8.PackagesPage(key: args.key);
    },
  );
}

class PackagesRouteArgs {
  const PackagesRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'PackagesRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PackagesRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i9.RoomDetailPage]
class RoomDetailRoute extends _i16.PageRouteInfo<RoomDetailRouteArgs> {
  RoomDetailRoute({
    required _i17.Room room,
    _i18.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         RoomDetailRoute.name,
         args: RoomDetailRouteArgs(room: room, key: key),
         initialChildren: children,
       );

  static const String name = 'RoomDetailRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RoomDetailRouteArgs>();
      return _i9.RoomDetailPage(room: args.room, key: args.key);
    },
  );
}

class RoomDetailRouteArgs {
  const RoomDetailRouteArgs({required this.room, this.key});

  final _i17.Room room;

  final _i18.Key? key;

  @override
  String toString() {
    return 'RoomDetailRouteArgs{room: $room, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RoomDetailRouteArgs) return false;
    return room == other.room && key == other.key;
  }

  @override
  int get hashCode => room.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i10.RoomOverviewPage]
class RoomOverviewRoute extends _i16.PageRouteInfo<void> {
  const RoomOverviewRoute({List<_i16.PageRouteInfo>? children})
    : super(RoomOverviewRoute.name, initialChildren: children);

  static const String name = 'RoomOverviewRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i10.RoomOverviewPage();
    },
  );
}

/// generated route for
/// [_i11.ShoppingItemOverviewPage]
class ShoppingItemOverviewRoute extends _i16.PageRouteInfo<void> {
  const ShoppingItemOverviewRoute({List<_i16.PageRouteInfo>? children})
    : super(ShoppingItemOverviewRoute.name, initialChildren: children);

  static const String name = 'ShoppingItemOverviewRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.ShoppingItemOverviewPage();
    },
  );
}

/// generated route for
/// [_i12.ShoppingItemPage]
class ShoppingItemRoute extends _i16.PageRouteInfo<ShoppingItemRouteArgs> {
  ShoppingItemRoute({
    required _i20.ShoppingItem? shoppingItem,
    _i18.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         ShoppingItemRoute.name,
         args: ShoppingItemRouteArgs(shoppingItem: shoppingItem, key: key),
         initialChildren: children,
       );

  static const String name = 'ShoppingItemRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ShoppingItemRouteArgs>();
      return _i12.ShoppingItemPage(
        shoppingItem: args.shoppingItem,
        key: args.key,
      );
    },
  );
}

class ShoppingItemRouteArgs {
  const ShoppingItemRouteArgs({required this.shoppingItem, this.key});

  final _i20.ShoppingItem? shoppingItem;

  final _i18.Key? key;

  @override
  String toString() {
    return 'ShoppingItemRouteArgs{shoppingItem: $shoppingItem, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ShoppingItemRouteArgs) return false;
    return shoppingItem == other.shoppingItem && key == other.key;
  }

  @override
  int get hashCode => shoppingItem.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i13.ShoppingListPage]
class ShoppingListRoute extends _i16.PageRouteInfo<ShoppingListRouteArgs> {
  ShoppingListRoute({
    required _i21.ShoppingList shoppingList,
    _i18.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         ShoppingListRoute.name,
         args: ShoppingListRouteArgs(shoppingList: shoppingList, key: key),
         initialChildren: children,
       );

  static const String name = 'ShoppingListRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ShoppingListRouteArgs>();
      return _i13.ShoppingListPage(
        shoppingList: args.shoppingList,
        key: args.key,
      );
    },
  );
}

class ShoppingListRouteArgs {
  const ShoppingListRouteArgs({required this.shoppingList, this.key});

  final _i21.ShoppingList shoppingList;

  final _i18.Key? key;

  @override
  String toString() {
    return 'ShoppingListRouteArgs{shoppingList: $shoppingList, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ShoppingListRouteArgs) return false;
    return shoppingList == other.shoppingList && key == other.key;
  }

  @override
  int get hashCode => shoppingList.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i14.ShoppingPage]
class ShoppingRoute extends _i16.PageRouteInfo<void> {
  const ShoppingRoute({List<_i16.PageRouteInfo>? children})
    : super(ShoppingRoute.name, initialChildren: children);

  static const String name = 'ShoppingRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i14.ShoppingPage();
    },
  );
}

/// generated route for
/// [_i15.TaskDetailPage]
class TaskDetailRoute extends _i16.PageRouteInfo<TaskDetailRouteArgs> {
  TaskDetailRoute({
    required _i22.Task task,
    _i18.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         TaskDetailRoute.name,
         args: TaskDetailRouteArgs(task: task, key: key),
         initialChildren: children,
       );

  static const String name = 'TaskDetailRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TaskDetailRouteArgs>();
      return _i15.TaskDetailPage(task: args.task, key: args.key);
    },
  );
}

class TaskDetailRouteArgs {
  const TaskDetailRouteArgs({required this.task, this.key});

  final _i22.Task task;

  final _i18.Key? key;

  @override
  String toString() {
    return 'TaskDetailRouteArgs{task: $task, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TaskDetailRouteArgs) return false;
    return task == other.task && key == other.key;
  }

  @override
  int get hashCode => task.hashCode ^ key.hashCode;
}
