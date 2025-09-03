// Affiche le résultat d'un calcul de ganache. Appelle les indicators.
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'screens_exportation_file.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';
import 'package:ganache_lab/models/change_notifier.dart';
import 'package:provider/provider.dart';

class CalculateGanache extends StatelessWidget {
  const CalculateGanache({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO Remplacer la ganache par une variable récupérée grâce au nom.
      appBar: AppBar(title: Consumer<TitleModel>(
          builder: (_, model, _) => Text(model.title.isEmpty ? "Votre Ganache" : model.title),),
      ),
      // TODO Rassembler les BottomAppbar
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Row(
          children: [
            IconButton(
              tooltip: "Partager la ganache",
              icon: const Icon(Symbols.share, fill: 1),
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
              icon: const Icon(Symbols.edit, fill: 1),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "Corriger",
        tooltip: "Corriger la ganache",
        label: Text("Corriger"),
        icon: Icon(Symbols.check),
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
                  "État de calcul",
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
                    Icon(Symbols.sentiment_very_satisfied),
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
                          Icon(Symbols.info),
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
