// Affiche le résultat d'un calcul de ganache. Appelle les indicators.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ganache_lab/widgets/total_weight.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'screens_exportation_file.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';
import 'package:ganache_lab/models/notifiers/ganache_title_notifier.dart';
import 'package:ganache_lab/models/notifiers/temperature_notifier.dart';
import 'package:ganache_lab/models/notifiers/chocolate_type_notifier.dart';
import 'package:provider/provider.dart';
import 'package:ganache_lab/services/calculation.dart';
import 'package:ganache_lab/models/recipe.dart';
import 'package:ganache_lab/models/notifiers/recipe_notifier.dart';
import 'package:ganache_lab/widgets/animated_count_text.dart';

class CalculateGanache extends StatelessWidget {
  const CalculateGanache({super.key});

  // --- UTILS ---

  String _getApplicationName(Application app) {
    if (app == Application.cadrage) return "Cadrage";
    if (app == Application.moulage) return "Moulage";
    return "Autre";
  }

  Recipe _createRecipeFromCurrentState(BuildContext context, {String id = "temp"}) {
    final titleModel = Provider.of<TitleModel>(context, listen: false);
    final totalModel = Provider.of<TotalModel>(context, listen: false);
    final chocoModel = Provider.of<ChocolateTypeModel>(context, listen: false);
    final tempModel = Provider.of<TemperatureModel>(context, listen: false);
    final appModel = Provider.of<ApplicationModel>(context, listen: false);

    return Recipe(
      id: id,
      title: titleModel.title.isEmpty ? "Ma Ganache" : titleModel.title,
      createdAt: DateTime.now(),
      chocolateWeight: totalModel.chocolateWeight,
      milkChocolateWeight: totalModel.milkChocolateWeight,
      creamWeight: totalModel.creamWeight,
      sugarWeight: totalModel.sugarWeight,
      butterWeight: totalModel.butterWeight,
      chocolateType: chocoModel.selection ?? "Inconnu",
      application: _getApplicationName(appModel.currentView),
      temperature: tempModel.temperature,
      totalWeight: totalModel.total,
      waterPercentage: totalModel.waterPercentage,
      fatPercentage: totalModel.totalFatPercentage,
      sugarPercentage: totalModel.sugarPercentage,
      solidsPercentage: totalModel.solidsPercentage,
      sweeteningPower: totalModel.sweeteningPower,
      awValue: totalModel.awValue,
    );
  }

  // --- ACTIONS ---

  void _showExportSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => ExportHubSheet(recipe: _createRecipeFromCurrentState(context)),
    );
  }

  void _saveRecipe(BuildContext context) {
    final recipe = _createRecipeFromCurrentState(context, id: DateTime.now().millisecondsSinceEpoch.toString());
    Provider.of<RecipeNotifier>(context, listen: false).addRecipe(recipe);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Ganache enregistrée avec succès !"), backgroundColor: Colors.green, duration: Duration(seconds: 2)),
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Navigation(initialIndex: 1)),
      (route) => false,
    );
  }

  // --- WIDGETS ---

  Widget _buildIngredientRow(String name, double weight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: const TextStyle(fontSize: 16)),
        AnimatedCountText(
          value: weight,
          suffix: " g",
          decimals: 1,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          duration: const Duration(milliseconds: 600),
        ),
      ],
    );
  }

  Widget _buildSummaryRow({required IconData icon, required String title, required Widget valueWidget}) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Text("$title :", style: const TextStyle(fontWeight: FontWeight.w500)),
        const Spacer(),
        valueWidget,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Consumer<TitleModel>(
          builder: (_, model, _) => Text(model.title.isEmpty ? "Votre Ganache" : model.title),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Row(
          children: [
            IconButton(
              tooltip: "Partager la ganache",
              icon: const Icon(Symbols.share, fill: 1),
              onPressed: () {
                HapticFeedback.lightImpact();
                _showExportSheet(context);
              },
            ),
            IconButton(
              tooltip: "Modifier la ganache",
              onPressed: () {
                HapticFeedback.lightImpact();
                Navigator.pop(context);
              },
              icon: const Icon(Symbols.edit, fill: 1),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "Save",
        label: const Text("Enregistrer"),
        icon: const Icon(Symbols.save),
        backgroundColor: const Color(0xFFEB8C36),
        foregroundColor: Colors.white,
        onPressed: () {
          HapticFeedback.mediumImpact();
          _saveRecipe(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("État de calcul", style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorScheme.primary)),
            ),
            
            // Recette Générée
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
                          Icon(Symbols.receipt_long, color: colorScheme.primary),
                          const SizedBox(width: 10),
                          Text("Recette générée", style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorScheme.primary)),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Consumer<ChocolateTypeModel>(
                        builder: (context, chocoModel, child) {
                          String chocoName = "Couverture Chocolat";
                          if (chocoModel.selection == "Noir") {
                            chocoName = "Couverture Noire";
                          } else if (chocoModel.selection == "Lait") {
                            chocoName = "Couverture Lait";
                          } else if (chocoModel.selection == "Blanc") {
                            chocoName = "Couverture Blanche";
                          }

                          return Column(
                            children: [
                              if (totalModel.chocolateWeight > 0) Column(children: [_buildIngredientRow(chocoName, totalModel.chocolateWeight), const Divider()]),
                              if (totalModel.milkChocolateWeight > 0) Column(children: [_buildIngredientRow("Couverture Lait", totalModel.milkChocolateWeight), const Divider()]),
                            ],
                          );
                        },
                      ),
                      _buildIngredientRow("Crème Liquide 35%", totalModel.creamWeight),
                      const Divider(),
                      _buildIngredientRow("Matière Sucrante", totalModel.sugarWeight),
                      const Divider(),
                      _buildIngredientRow("Beurre Laitier 82%", totalModel.butterWeight),
                    ],
                  ),
                );
              },
            ),
            
            const TotalWeightGanache(),
            
            // Résumé
            CustomContainer(
              borderRadius: 12,
              borderWidth: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Symbols.settings_suggest, color: colorScheme.primary, fill: 1),
                      const SizedBox(width: 10),
                      Text("Résumé des paramètres", style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorScheme.primary)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Consumer<ApplicationModel>(
                    builder: (context, app, _) => _buildSummaryRow(
                      icon: Symbols.grid_view,
                      title: "Application",
                      valueWidget: Text(_getApplicationName(app.currentView), style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const Divider(),
                  Consumer<ChocolateTypeModel>(
                    builder: (context, choco, _) => _buildSummaryRow(
                      icon: Symbols.cookie,
                      title: "Chocolat",
                      valueWidget: Text(choco.selection ?? "Non défini", style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const Divider(),
                  Consumer<TemperatureModel>(
                    builder: (context, temp, _) => _buildSummaryRow(
                      icon: Symbols.device_thermostat,
                      title: "Température",
                      valueWidget: AnimatedCountText(
                        value: temp.temperature,
                        suffix: " °C",
                        decimals: 0,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        duration: const Duration(milliseconds: 600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const Indicator(),
            
            CustomContainer(
              borderRadius: 12,
              borderWidth: 1,
              child: const Row(
                children: [
                  Icon(Symbols.info),
                  SizedBox(width: 10),
                  Expanded(child: Text("Les informations calculées par Ganache.lab sont à titre indicatif. Des variations peuvent survenir lors de la préparation réelle des recettes.")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
