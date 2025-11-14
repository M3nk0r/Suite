import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/cross_cutting/entities/room.dart';
import 'package:suite/cross_cutting/entities/task.dart';
import 'package:suite/cross_cutting/enums/interval_typ.dart';
import 'package:suite/injection.dart';
import 'package:suite/ui/controllers/task_form/task_form_cubit.dart';
import 'package:suite/ui/controllers/task_form/task_form_state.dart';

class TaskForm extends StatelessWidget {
  final Room? room;
  final Task? task;
  final bool isUpdate;
  const TaskForm({this.room, this.task, this.isUpdate = false, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TaskFormCubit>()..init(room, task, isUpdate),
      child: BlocBuilder<TaskFormCubit, TaskFormState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                initialValue: state.name,
                onChanged: (value) =>
                    context.read<TaskFormCubit>().onChangeName(value),
              ),
              const SizedBox( height: 16,),
              DropdownMenu<IntervalTyp>(
                label: Text('Interval typ'),
                initialSelection: state.intervalTyp,
                onSelected: (value) => context.read<TaskFormCubit>().onSelectedIntervalTyp(value),
                dropdownMenuEntries: [
                  DropdownMenuEntry<IntervalTyp>(value: IntervalTyp.days, label: 'days'),
                  DropdownMenuEntry<IntervalTyp>(value: IntervalTyp.weeks, label: 'weeks'),
                  DropdownMenuEntry<IntervalTyp>(value: IntervalTyp.month, label: 'month'),
                  DropdownMenuEntry<IntervalTyp>(value: IntervalTyp.years, label: 'years'),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Interval'),
                initialValue: state.interval.toString(),
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^\d*'))
                ],
                onChanged: (value) =>
                    context.read<TaskFormCubit>().onChangeInterval(value),
              ),
              const SizedBox( height: 16,),
              TextFormField(
                decoration: InputDecoration(labelText: 'Duration in minutes'),
                initialValue: state.duration.toString(),
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^\d*'))
                ],
                onChanged: (value) =>
                    context.read<TaskFormCubit>().onChangeDuration(value),
              ),
              const SizedBox( height: 16,),
              ElevatedButton(
                onPressed: () async {
                  await context.read<TaskFormCubit>().addOrUpdate();

                  if(context.mounted){
                    context.router.pop();
                  }
                },
                child: Text('Save'),
              ),
            ],
          );
        }
      ),
    );
  }
}
