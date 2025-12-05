import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:suite/ui/router.gr.dart';

@RoutePage()
class OptionPage extends StatelessWidget {
  const OptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Option')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.router.push(PackagesRoute());
                  },
                  child: Text('Use packages')),
              ElevatedButton(
                  onPressed: () {
                    context.router.push(ImpressumRoute());
                  },
                  child: Text('Impressum')),
            ],
          ),
        ),
      ),
    );
  }
}
