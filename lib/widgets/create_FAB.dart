import 'package:flutter/material.dart';
import 'package:ganache_lab/screens/create_ganache.dart';
class create_fab extends StatelessWidget {
  const create_fab ({super.key});
  build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: "createGanache",
      label: const Text("Créer sa ganache"),
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateGanache()),
        );
      },
      backgroundColor: Color(0xFFEB8C36),
      foregroundColor: Colors.white,
    );
  }
}