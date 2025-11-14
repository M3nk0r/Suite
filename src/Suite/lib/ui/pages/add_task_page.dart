import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:suite/cross_cutting/entities/room.dart';
import 'package:suite/ui/widgets/task_form.dart';

@RoutePage()
class AddTaskPage extends StatelessWidget {
  final Room room;

  const AddTaskPage({required this.room, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add task')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: TaskForm(room: room, isUpdate: false,)
        ),
      ),
    );
  }
}
