// Affiche le résultat d'un calcul de ganache. Appelle les indicators.
import 'package:flutter/material.dart';
import 'screens_exportation_file.dart';
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
                Navigator.pop(
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Correction()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      body: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "État de correction",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1),
                  // border: Border.all(width: 1),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: const Row(
                  children: [
                    Icon(Icons.sentiment_very_satisfied),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Votre ganache est idéale pour une application en cadre.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Indicator(),
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1),
                  // border: Border.all(width: 1),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: SizedBox(
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.info_outline),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Les informations calculées par Ganache.lab sont à titre indicatif. Des variations peuvent survenir lors de la préparation réelle des recettes.",
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Text(
                        "Pour améliorer votre ganache appuyez sur le bouton orange, ci dessous.",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
