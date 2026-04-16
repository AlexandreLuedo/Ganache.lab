// This file stores all the pages displayed when clicking on any indicators.
// It extends the indicators to allow more detailed explanations.

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:ganache_lab/services/calculation.dart';
import 'package:ganache_lab/services/aw.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';

class ExtendedHumidity extends StatelessWidget {
  const ExtendedHumidity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Symbols.water_drop),
            SizedBox(width: 5),
            Text("Humidité"),
          ],
        ),
        actions: [
          GlossaryButton(),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          CustomContainer(
            margin: 0.0,
            padding: 10.0,
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Taux d'humidité actuel",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Consumer<TotalModel>(
                  builder: (context, recipe, child) {
                    final double humidity = recipe.waterPercentage * 100;
                    String label = "Optimale !";
                    if (humidity < 18) label = "Trop Faible !";
                    if (humidity > 25) label = "Trop Élevée !";
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${humidity.toStringAsFixed(1)}%", style: Theme.of(context).textTheme.displayLarge),
                        Text(label, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: CustomContainer(
              margin: 0.0,
              padding: 15.0,
              color: Colors.transparent,
              borderColor: Theme.of(context).colorScheme.primary,
              borderWidth: 1.0,
              borderRadius: 20,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "L'humidité représente la quantité d'eau libre et liée dans votre ganache.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "• Cible Idéale (18% - 25%) : C'est la zone de sécurité. Elle permet d'obtenir un fondant parfait tout en limitant le risque de moisissures.",
                  ),
                  SizedBox(height: 8),
                  Text(
                    "• Zone Critique (> 25%) : La ganache sera très fondante mais instable. Risque élevé de développement bactérien et difficulté de cadrage.",
                  ),
                  SizedBox(height: 8),
                  Text(
                    "• Zone Sèche (< 18%) : La ganache risque d'être cassante en bouche et de perdre son onctuosité caractéristique.",
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Note : Pour le moulage, on préfère une humidité proche de 20% pour maximiser la conservation.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExtendedTexture extends StatelessWidget {
  const ExtendedTexture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Symbols.waves),
            SizedBox(width: 5),
            Text("Texture"),
          ],
        ),
        actions: [
          GlossaryButton(),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          CustomContainer(
            margin: 0.0,
            padding: 10.0,
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Analyse de la texture",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Consumer<TotalModel>(
                  builder: (context, recipe, child) {
                    final double fat = recipe.totalFatPercentage * 100;
                    final double water = recipe.waterPercentage * 100;
                    
                    String textureLabel = "Fondante";
                    if (water > 25) textureLabel = "Trop Molle";
                    else if (water < 18) textureLabel = "Trop Ferme";
                    else if (fat < 30) textureLabel = "Sèche";
                    else if (fat > 42) textureLabel = "Grasse";
                    else textureLabel = "Équilibrée";
                    
                    return Text(textureLabel, style: Theme.of(context).textTheme.displayLarge);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: CustomContainer(
              margin: 0.0,
              padding: 15.0,
              color: Colors.transparent,
              borderColor: Theme.of(context).colorScheme.primary,
              borderWidth: 1.0,
              borderRadius: 20,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "La texture est le résultat de l'équilibre entre les graisses (fermeté) et les liquides (onctuosité).",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "• Trop Molle : Excès d'eau ou manque de beurre de cacao. La ganache ne se tiendra pas après le refroidissement.",
                  ),
                  SizedBox(height: 8),
                  Text(
                    "• Équilibrée : Le ratio idéal pour une ganache qui fond à température du corps sans être huileuse.",
                  ),
                  SizedBox(height: 8),
                  Text(
                    "• Sèche / Maigre : Manque de matières grasses. La texture sera granuleuse ou trop ferme, manquant de 'longueur en bouche'.",
                  ),
                  SizedBox(height: 15),
                  Text(
                    "L'ajout de beurre (MGB) apporte du fondant, tandis que le chocolat (BC) apporte la structure nécessaire au cadrage.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExtendedSugarSweetening extends StatelessWidget {
  const ExtendedSugarSweetening({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Symbols.balance),
            SizedBox(width: 5),
            Text("Pouvoir sucrant"),
          ],
        ),
        actions: [
          GlossaryButton(),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          CustomContainer(
            margin: 0.0,
            padding: 10.0,
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Score de pouvoir sucrant (POD)",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Consumer<TotalModel>(
                  builder: (context, recipe, child) {
                    final double pod = recipe.sweeteningPower;
                    String label = "Modéré !";
                    if (pod < 25) label = "Faible !";
                    if (pod > 40) label = "Élevé !";
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(pod.toStringAsFixed(1), style: Theme.of(context).textTheme.displayLarge),
                        Text(label, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: CustomContainer(
              margin: 0.0,
              padding: 15.0,
              color: Colors.transparent,
              borderColor: Theme.of(context).colorScheme.primary,
              borderWidth: 1.0,
              borderRadius: 20,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Le Pouvoir Sucrant (POD) mesure l'intensité de la saveur sucrée par rapport au saccharose (1.0).",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "• Faible (< 25) : Risque de manque de gourmandise et conservation réduite (AW plus élevée).",
                  ),
                  SizedBox(height: 8),
                  Text(
                    "• Modéré (25 - 40) : Équilibre idéal entre goût, texture fondante et conservation.",
                  ),
                  SizedBox(height: 8),
                  Text(
                    "• Élevé (> 40) : Goût sucré dominant, peut masquer les arômes délicats du cacao.",
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Un bon équilibre permet de fixer l'eau libre (AW) tout en préservant le profil aromatique du chocolat.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExtendedDLC extends StatelessWidget {
  const ExtendedDLC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Symbols.kitchen),
            SizedBox(width: 5),
            Text("Durée de vie"),
          ],
        ),
        actions: [
          GlossaryButton(),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          CustomContainer(
            margin: 0.0,
            padding: 10.0,
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Activité de l'eau (Aw)",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Consumer<TotalModel>(
                  builder: (context, recipe, child) {
                    final double aw = recipe.awValue;
                    int days = AwService.getDaysFromAw(aw);
                    String label = "Stable !";
                    if (aw > 0.80) label = "Courte !";
                    if (aw > 0.85) label = "Risquée !";
                    
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(aw.toStringAsFixed(2), style: Theme.of(context).textTheme.displayLarge),
                        Text("Conservation : $days jours ($label)", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: CustomContainer(
              margin: 0.0,
              padding: 15.0,
              color: Colors.transparent,
              borderColor: Theme.of(context).colorScheme.primary,
              borderWidth: 1.0,
              borderRadius: 20,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "L'Aw (Activity of Water) mesure l'eau disponible pour le développement des micro-organismes.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "• < 0.80 : Excellente conservation. La ganache peut être conservée plusieurs mois à température ambiante (16-18°C).",
                  ),
                  SizedBox(height: 8),
                  Text(
                    "• 0.80 - 0.85 : Conservation limitée. À consommer sous quelques semaines.",
                  ),
                  SizedBox(height: 8),
                  Text(
                    "• > 0.85 : Risque élevé de moisissures. Conservation au frais recommandée et consommation rapide.",
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Ganache.lab utilise la formule de Ross pour prédire cette valeur en fonction de la fraction molaire de vos sucres.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
