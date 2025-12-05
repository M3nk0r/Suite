import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suite/injection.dart';
import 'package:suite/ui/controllers/base/base_cubit.dart';
import 'package:suite/ui/controllers/base/base_state.dart';
import 'package:suite/ui/pages/home_page.dart';
import 'package:suite/ui/pages/option_page.dart';
import 'package:suite/ui/pages/room_overview_page.dart';
import 'package:suite/ui/router.gr.dart';

@RoutePage()
class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BaseCubit>(),
      child: BlocBuilder<BaseCubit, BaseState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Suite"),
              actions: [
                IconButton(onPressed: (){
                  context.router.push(OptionRoute());
                }, icon: Icon(Icons.more_vert))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Shopping'),
              ],
              currentIndex: state.pageIndex,
              onTap: (index){
                context.read<BaseCubit>().onBottomNavigationBarTap(index);
              },
            ),
            body: Builder(builder: (builder){
              switch(state.pageIndex){
                case 0:
                  return HomePage();
                case 1:
                  return RoomOverviewPage();
              }
              return Placeholder();
            }),
          );
        }
      ),
    );
  }
}
