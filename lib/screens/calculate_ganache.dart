// Affiche le résultat d'un calcul de ganache. Appelle les indicators.
import 'package:flutter/material.dart';
import 'package:ganache_lab/widgets/total_weight.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'screens_exportation_file.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';
import 'package:ganache_lab/models/notifiers/ganache_title_notifier.dart';
import 'package:provider/provider.dart';
import 'package:ganache_lab/services/calculation.dart';

class CalculateGanache extends StatelessWidget {
  const CalculateGanache({super.key});

  Widget _buildIngredientRow(String name, double weight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: const TextStyle(fontSize: 16)),
        Text("${weight.toStringAsFixed(1)} g", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<TitleModel>(
          builder:
              (_, model, _) =>
                  Text(model.title.isEmpty ? "Votre Ganache" : model.title),
        ),
      ),
      // TODO Gather the BottomAppbars
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
              Consumer<TotalModel>(
                builder: (context, totalModel, child) {
                  return Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Symbols.receipt_long),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Recette générée :",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        _buildIngredientRow("Chocolat", totalModel.chocolateWeight),
                        const Divider(),
                        _buildIngredientRow("Crème Liquide", totalModel.creamWeight),
                        const Divider(),
                        _buildIngredientRow("Sucre / Miel", totalModel.sugarWeight),
                        const Divider(),
                        _buildIngredientRow("Beurre", totalModel.butterWeight),
                      ],
                    ),
                  );
                },
              ),
              TotalWeightGanache(),
              Indicator(),
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1),
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
