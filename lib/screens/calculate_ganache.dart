// Affiche le résultat d'un calcul de ganache. Appelle les indicators.
import 'package:flutter/material.dart';
import 'package:ganache_lab/widgets/total_weight.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'screens_exportation_file.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';
import 'package:ganache_lab/models/notifiers/ganache_title_notifier.dart';
import 'package:ganache_lab/models/notifiers/temperature_notifier.dart';
import 'package:ganache_lab/models/notifiers/chocolate_type_notifier.dart';
import 'package:ganache_lab/models/notifiers/weight_ganache_notifier.dart';
import 'package:provider/provider.dart';
import 'package:ganache_lab/services/calculation.dart';
import 'package:ganache_lab/widgets/ganache_type_selection.dart';

class CalculateGanache extends StatelessWidget {
  const CalculateGanache({super.key});

  Widget _buildIngredientRow(String name, double weight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: const TextStyle(fontSize: 16)),
        Text(
          "${weight.toStringAsFixed(1)} g",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSummaryRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Text("$title :", style: const TextStyle(fontWeight: FontWeight.w500)),
        const Spacer(),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<TitleModel>(
          builder: (_, model, _) =>
              Text(model.title.isEmpty ? "Votre Ganache" : model.title),
        ),
      ),
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
                Navigator.pop(context);
              },
              icon: const Icon(Symbols.edit, fill: 1),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "Save",
        tooltip: "Enregistrer la ganache",
        label: const Text("Enregistrer"),
        icon: const Icon(Symbols.save),
        backgroundColor: const Color(0xFFEB8C36),
        foregroundColor: Colors.white,
        onPressed: () {
          // TODO: Implement save logic
        },
      ),      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "État de calcul",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            Consumer<TotalModel>(
              builder: (context, totalModel, child) {
                return CustomContainer(
                  borderRadius: 12,
                  borderWidth: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Symbols.receipt_long,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Recette générée",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      // Dynamic Ingredients based on the calculation
                      Consumer<ChocolateTypeModel>(
                        builder: (context, chocoModel, child) {
                          String chocolateName = "Couverture Chocolat";
                          if (chocoModel.selection == "Noir") {
                            chocolateName = "Couverture Noire";
                          } else if (chocoModel.selection == "Lait") {
                            chocolateName = "Couverture Lait";
                          } else if (chocoModel.selection == "Blanc") {
                            chocolateName = "Couverture Blanche";
                          } else if (chocoModel.selection == "Noir/Lait") {
                            chocolateName = "Couverture Noire";
                          }

                          return Column(
                            children: [
                              if (totalModel.chocolateWeight > 0)
                                Column(
                                  children: [
                                    _buildIngredientRow(
                                      chocolateName,
                                      totalModel.chocolateWeight,
                                    ),
                                    const Divider(),
                                  ],
                                ),
                              if (totalModel.milkChocolateWeight > 0)
                                Column(
                                  children: [
                                    _buildIngredientRow(
                                      "Couverture Lait",
                                      totalModel.milkChocolateWeight,
                                    ),
                                    const Divider(),
                                  ],
                                ),
                            ],
                          );
                        },
                      ),
                      _buildIngredientRow(
                        "Crème Liquide 35%",
                        totalModel.creamWeight,
                      ),
                      const Divider(),
                      _buildIngredientRow(
                        "Matière Sucrante",
                        totalModel.sugarWeight,
                      ),
                      const Divider(),
                      _buildIngredientRow(
                        "Beurre Laitier 82%",
                        totalModel.butterWeight,
                      ),
                    ],
                  ),
                );
              },
            ),
            const TotalWeightGanache(),
            CustomContainer(
              borderRadius: 12,
              borderWidth: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Résumé des paramètres",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 15),
                  Consumer<ApplicationModel>(
                    builder: (context, app, child) {
                      String appName = "Autre";
                      if (app.currentView == Application.cadrage) {
                        appName = "Cadrage";
                      } else if (app.currentView == Application.moulage) {
                        appName = "Moulage";
                      }
                      return _buildSummaryRow(
                        icon: Symbols.grid_view,
                        title: "Application",
                        value: appName,
                      );
                    },
                  ),
                  const Divider(),
                  Consumer<ChocolateTypeModel>(
                    builder: (context, choco, child) {
                      return _buildSummaryRow(
                        icon: Symbols.cookie,
                        title: "Chocolat",
                        value: choco.selection ?? "Non défini",
                      );
                    },
                  ),
                  const Divider(),
                  Consumer<TemperatureModel>(
                    builder: (context, temp, child) {
                      return _buildSummaryRow(
                        icon: Symbols.device_thermostat,
                        title: "Température",
                        value: "${temp.temperature.toStringAsFixed(0)} °C",
                      );
                    },
                  ),
                ],
              ),
            ),
            const Indicator(),
            CustomContainer(
              borderRadius: 12,
              borderWidth: 1,
              child: const Column(
                children: [
                  Row(
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
          ],
        ),
      ),
    );
  }
}
