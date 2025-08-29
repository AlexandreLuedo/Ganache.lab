// FAB "+ Créer sa ganache"
import 'package:flutter/material.dart';
import 'package:ganache_lab/screens/create_ganache.dart';
import 'package:material_symbols_icons/symbols.dart';

class CreateFab extends StatefulWidget {
  const CreateFab({super.key});

  @override
  State<CreateFab> createState() => _CreateFabState();
}

class _CreateFabState extends State<CreateFab> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: "createGanache",
      label: const Text("Créer sa ganache"),
      icon: const Icon(Symbols.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateGanache()),
        );
      },
      backgroundColor: const Color(0xFFEB8C36),
      foregroundColor: Colors.white,
    );
  }
}
