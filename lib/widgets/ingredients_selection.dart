// Selection d'ingrédients
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:ganache_lab/widgets/custom_container.dart';

class GanacheIngredients extends StatelessWidget {
  const GanacheIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemple de données d’ingrédients
    final ingredients = [
      {'title': 'Chocolat', 'subtitle': 'Selon sélection'},
      {'title': 'Crème Liquide', 'subtitle': '35% MG'},
      {'title': 'Sucre Inverti / Miel', 'subtitle': 'Sucre'},
      {'title': 'Beurre Doux', 'subtitle': 'Matière grasse'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Ingrédients calculés",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            IconButton(
              tooltip: "Ajouter un ingrédient",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Mode Manuel (Roadmap)"),
                      content: const Text(
                        "L'ajout d'ingrédients manuels sera disponible dans une prochaine version pour analyser vos propres recettes. Actuellement, Ganache.lab génère la recette pour vous !",
                      ),
                      actions: <Widget>[
                        FilledButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Fermer"),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Symbols.add),
            ),
          ],
        ),
        // Génération dynamique de containers + ListTile
        ...ingredients.map((ingredient) {
          return CustomContainer(
            margin: 4.0,
            padding: 8.0,
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: 12,
            child: ListTile(
              leading: const Icon(Symbols.widgets, fill: 1),
              title: Text("${ingredient['title']}"),
              subtitle: Text("${ingredient['subtitle']}"),
            ),
          );
        }),
      ],
    );
  }
}
