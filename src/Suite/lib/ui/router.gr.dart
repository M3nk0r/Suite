// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i12;
import 'package:suite/cross_cutting/entities/room.dart' as _i11;
import 'package:suite/cross_cutting/entities/task.dart' as _i13;
import 'package:suite/ui/pages/add_task_page.dart' as _i1;
import 'package:suite/ui/pages/base_page.dart' as _i2;
import 'package:suite/ui/pages/home_page.dart' as _i3;
import 'package:suite/ui/pages/option/impressum_page.dart' as _i4;
import 'package:suite/ui/pages/option/packages_page.dart' as _i6;
import 'package:suite/ui/pages/option_page.dart' as _i5;
import 'package:suite/ui/pages/room_detail_page.dart' as _i7;
import 'package:suite/ui/pages/room_overview_page.dart' as _i8;
import 'package:suite/ui/pages/task_detail_page.dart' as _i9;

/// generated route for
/// [_i1.AddTaskPage]
class AddTaskRoute extends _i10.PageRouteInfo<AddTaskRouteArgs> {
  AddTaskRoute({
    required _i11.Room room,
    _i12.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         AddTaskRoute.name,
         args: AddTaskRouteArgs(room: room, key: key),
         initialChildren: children,
       );

  static const String name = 'AddTaskRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddTaskRouteArgs>();
      return _i1.AddTaskPage(room: args.room, key: args.key);
    },
  );
}

class AddTaskRouteArgs {
  const AddTaskRouteArgs({required this.room, this.key});

  final _i11.Room room;

  final _i12.Key? key;

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
class BaseRoute extends _i10.PageRouteInfo<void> {
  const BaseRoute({List<_i10.PageRouteInfo>? children})
    : super(BaseRoute.name, initialChildren: children);

  static const String name = 'BaseRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.BasePage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.ImpressumPage]
class ImpressumRoute extends _i10.PageRouteInfo<void> {
  const ImpressumRoute({List<_i10.PageRouteInfo>? children})
    : super(ImpressumRoute.name, initialChildren: children);

  static const String name = 'ImpressumRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.ImpressumPage();
    },
  );
}

/// generated route for
/// [_i5.OptionPage]
class OptionRoute extends _i10.PageRouteInfo<void> {
  const OptionRoute({List<_i10.PageRouteInfo>? children})
    : super(OptionRoute.name, initialChildren: children);

  static const String name = 'OptionRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.OptionPage();
    },
  );
}

/// generated route for
/// [_i6.PackagesPage]
class PackagesRoute extends _i10.PageRouteInfo<PackagesRouteArgs> {
  PackagesRoute({_i12.Key? key, List<_i10.PageRouteInfo>? children})
    : super(
        PackagesRoute.name,
        args: PackagesRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'PackagesRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PackagesRouteArgs>(
        orElse: () => const PackagesRouteArgs(),
      );
      return _i6.PackagesPage(key: args.key);
    },
  );
}

class PackagesRouteArgs {
  const PackagesRouteArgs({this.key});

  final _i12.Key? key;

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
/// [_i7.RoomDetailPage]
class RoomDetailRoute extends _i10.PageRouteInfo<RoomDetailRouteArgs> {
  RoomDetailRoute({
    required _i11.Room room,
    _i12.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         RoomDetailRoute.name,
         args: RoomDetailRouteArgs(room: room, key: key),
         initialChildren: children,
       );

  static const String name = 'RoomDetailRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RoomDetailRouteArgs>();
      return _i7.RoomDetailPage(room: args.room, key: args.key);
    },
  );
}

class RoomDetailRouteArgs {
  const RoomDetailRouteArgs({required this.room, this.key});

  final _i11.Room room;

  final _i12.Key? key;

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
/// [_i8.RoomOverviewPage]
class RoomOverviewRoute extends _i10.PageRouteInfo<void> {
  const RoomOverviewRoute({List<_i10.PageRouteInfo>? children})
    : super(RoomOverviewRoute.name, initialChildren: children);

  static const String name = 'RoomOverviewRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.RoomOverviewPage();
    },
  );
}

/// generated route for
/// [_i9.TaskDetailPage]
class TaskDetailRoute extends _i10.PageRouteInfo<TaskDetailRouteArgs> {
  TaskDetailRoute({
    required _i13.Task task,
    _i12.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         TaskDetailRoute.name,
         args: TaskDetailRouteArgs(task: task, key: key),
         initialChildren: children,
       );

  static const String name = 'TaskDetailRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TaskDetailRouteArgs>();
      return _i9.TaskDetailPage(task: args.task, key: args.key);
    },
  );
}

class TaskDetailRouteArgs {
  const TaskDetailRouteArgs({required this.task, this.key});

  final _i13.Task task;

  final _i12.Key? key;

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
