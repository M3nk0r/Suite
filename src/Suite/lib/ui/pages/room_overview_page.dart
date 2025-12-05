import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/injection.dart';
import 'package:suite/ui/controllers/room_overview/room_overview_cubit.dart';
import 'package:suite/ui/controllers/room_overview/room_overview_state.dart';
import 'package:suite/ui/router.gr.dart';
import 'package:suite/ui/widgets/add_room_dialog.dart';

@RoutePage()
class RoomOverviewPage extends StatelessWidget {
  const RoomOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RoomOverviewCubit>()..init(),
      child: BlocBuilder<RoomOverviewCubit, RoomOverviewState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final roomName = await showDialog<String?>(
                  context: context,
                  builder: (builderDialog) => AddRoomDialog(),
                );

                if (roomName != null && context.mounted) {
                  await context.read<RoomOverviewCubit>().addRoom(roomName);
                }
              },
              child: const Icon(Icons.add),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: state.rooms.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(state.rooms[index].name), onTap: (){
                    context.router.push(RoomDetailRoute(room: state.rooms[index]));
                  },);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
