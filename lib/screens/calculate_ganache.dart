import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'create_ganache.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';

class CalculateGanache extends StatelessWidget {
  const CalculateGanache({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO Remplacer la ganache par une variable récupérée grâce au nom.
      appBar: AppBar(title: const Text("Ganache chocolat Callebaut 56%")),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Row(
          children: [
            IconButton(
              tooltip: "Partager la ganache",
              icon: const Icon(Icons.share),
              onPressed: () {},
            ),
            IconButton(
              tooltip: "Modifier la ganache",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateGanache()),
                  // TODO va pas fonctionner (je pense)
                );
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "Corriger",
        tooltip: "Corriger la ganache",
        label: Text("Corriger"),
        icon: Icon(Icons.check),
        backgroundColor: Color(0xFFEB8C36),
        foregroundColor: Colors.white,
        onPressed: () {
          // TODO à implémenter
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(15),
              //border: Border.all(width: 1),
            ),
            child: Column(
              children: [
                Text(
                  "État de correction",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Divider(),
                Text(
                  "Indications :",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                   // border: Border.all(width: 1),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Text(
                    "Votre ganache est idéale pour la mettre en cadre.",
                  ),
                ),
              ],
            ),
          ),
          // We are here
        ],
      ),
    );
  }
}
