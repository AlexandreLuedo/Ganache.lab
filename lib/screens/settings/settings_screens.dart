import 'package:flutter/material.dart';
import 'about_application_screen.dart';
import 'package:material_symbols_icons/symbols.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(child: Icon(Symbols.info, fill: 1)),
              title: Text('À propos de Ganache.lab'),
              subtitle: Text('En savoir plus sur l\'application'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutApplicationScreen()),
                );
              },
            ),
            Divider(color: Colors.grey),
            Text(
              ''' Ganache.lab est un calculateur de ganaches...''',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
