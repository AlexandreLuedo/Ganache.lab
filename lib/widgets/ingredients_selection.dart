import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:ganache_lab/models/notifiers/chocolate_type_notifier.dart';
import 'package:ganache_lab/widgets/custom_container.dart';

class GanacheIngredients extends StatelessWidget {
  const GanacheIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    // We listen to the chocolate selection to know which ingredients are part of the recipe
    final choco = context.watch<ChocolateTypeModel>();
    final selection = choco.selection;

    // Building the list of ingredients labels based on the chocolate type
    final List<String> ingredients = [];

    if (selection != null) {
      if (selection == "Noir/Lait") {
        ingredients.add('Couverture Noire');
        ingredients.add('Couverture Lait');
      } else if (selection == "Lait") {
        ingredients.add('Couverture Lait');
      } else if (selection == "Blanc") {
        ingredients.add('Couverture Blanche');
      } else {
        ingredients.add('Couverture Chocolat');
      }

      // Base ingredients for any ganache
      ingredients.add('Crème Liquide 35%');
      ingredients.add('Matière Sucrante');
      ingredients.add('Beurre Laitier');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Ingrédients utilisés",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            IconButton(
              tooltip: "Ajouter un ingrédient",
              onPressed: () {
                // TODO: Implement ingredient addition
              },
              icon: Icon(
                Symbols.add_circle,
                fill: 1,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // If no chocolate type selected, show a message
        if (ingredients.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: Text(
                "Sélectionnez un type de ganache pour voir les ingrédients",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ),
          )
        else
          ...ingredients.map((name) {
            return CustomContainer(
              margin: 4.0,
              padding: 2.0,
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: 12,
              child: ListTile(
                leading: const Icon(Symbols.widgets, fill: 1),
                title: Text(name),
              ),
            );
          }),
      ],
    );
  }
}
