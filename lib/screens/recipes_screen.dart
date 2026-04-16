// Displays recipes via the db
import 'package:flutter/material.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';
import 'package:material_symbols_icons/symbols.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600; // Yes it's dumb
    return Scaffold(
      floatingActionButton: isMobile ? CreateFab() : null,
      appBar: AppBar(
        // centerTitle: true,
        title: const Text(
          'Recettes' /*,
        style: TextStyle(fontWeight: FontWeight.bold)*/,
        ),
      ),
      body: EmptyRecipeMessage(),
    );
  }
}

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [



    ],
  );
  }
}

class EmptyRecipeMessage extends StatelessWidget {
  const EmptyRecipeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500, minWidth: 100),
              child: const Image(
                image: AssetImage('assets/png/Empty_recipe_small_res.png'),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Aucune recette n\'est calculée pour le moment. \n Vous pouvez en créer une en cliquant sur "Créer sa ganache"',
              style: TextStyle(color: Colors.grey, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
