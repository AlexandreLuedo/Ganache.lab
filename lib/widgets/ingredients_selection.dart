// Selection d'ingrédients
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class GanacheIngredients extends StatelessWidget {
  const GanacheIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemple de données d’ingrédients
    final ingredients = [
      {'title': 'Chocolat', 'subtitle': 'Callebaut 58% min.'},
      {'title': 'Crème', 'subtitle': '35% MG'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Liste des ingrédients",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            IconButton(
              tooltip: "Ajouter un ingrédient",
              onPressed: () {
                /* TODO Ajouter le onPressed */
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Ajouter un Ingrédient"),
                      content: const Text(
                        /* TODO Ajouter l\'ajout d\'ingrédients */
                        "",
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Ferme le dialog
                          },
                          child: const Text("Ajouter"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Ferme le dialog
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
        const SizedBox(height: 8),
        // Génération dynamique de containers + ListTile
        ...ingredients.map((ingredient) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              // TODO Ajouter le swipe pour supprimer un ingrédient et modifier la valeur !
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
