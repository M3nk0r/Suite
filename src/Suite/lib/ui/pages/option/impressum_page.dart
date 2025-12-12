import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ImpressumPage extends StatelessWidget {
  const ImpressumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Impressum'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Hinweis Datenspeichern', style: Theme.of(context).textTheme.headlineSmall,),
              Text(
                  'Alle in der App erfassten Daten, werden ausschließlich auf Ihrem Endgerät gespeichert. Es werden keine Daten an einen Server gesendet.'),
              const SizedBox(
                height: 16,
              ),
              Text('Haftungshinweis', style: Theme.of(context).textTheme.headlineSmall,),
              Text(
                  'Ich übernehme keine Haftung für die Inhalte externer Links. Für den Inhalt der verlinkten Seiten sind ausschließlich deren Betreiber verantwortlich.'),
              const SizedBox(
                height: 16,
              ),
              Text('Impressum', style: Theme.of(context).textTheme.headlineSmall,),
              Text('Lukas Buchecker'),
              Text('Puricellistraße 32'),
              Text('93049 Regensburg'),
              Text('Email: moin@lukasbuchecker.de'),
            ],
          ),
        ),
      ),
    );
  }
}
