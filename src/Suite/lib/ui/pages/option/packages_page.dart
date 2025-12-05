import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:suite/cross_cutting/helpers/packages.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class PackagesPage extends StatelessWidget {

  final packages = [
    Packages(name: 'flutter', url: 'https://flutter.dev'),
    Packages(name: 'cupertino_icons', url: 'https://pub.dev/packages/cupertino_icons'),
    Packages(name: 'sqflite', url: 'https://pub.dev/packages/sqflite'),
    Packages(name: 'path', url: 'https://pub.dev/packages/path'),
    Packages(name: 'flutter_bloc', url: 'https://pub.dev/packages/flutter_bloc'),
    Packages(name: 'get_it', url: 'https://pub.dev/packages/get_it'),
    Packages(name: 'auto_route', url: 'https://pub.dev/packages/auto_route'),
    Packages(name: 'intl', url: 'https://pub.dev/packages/intl'),
    Packages(name: 'url_launcher', url: 'https://pub.dev/packages/url_launcher'),
    Packages(name: 'uuid', url: 'https://pub.dev/packages/uuid'),

  ];

  PackagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Benutzte Pakete'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: packages.length,
                itemBuilder: (context, index){

                  return  ListTile(
                    title: Text(packages[index].name),
                    subtitle: Text('Url: ${packages[index].url}'),
                    trailing: Icon(Icons.link),
                    onTap: () async {
                      await launchUrlString(packages[index].url);
                    },
                  );
                })
        ),
      ),
    );
  }
}
