// Displays recipes via the db (Actually from RecipeNotifier now)
import 'package:flutter/material.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:ganache_lab/models/notifiers/recipe_notifier.dart';
import 'package:ganache_lab/models/recipe.dart';
import 'recipe_detail_screen.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  String _formatDate(DateTime dt) {
    return "${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}";
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      floatingActionButton: isMobile ? const CreateFab() : null,
      appBar: AppBar(title: const Text('Recettes')),
      body: Consumer<RecipeNotifier>(
        builder: (context, notifier, child) {
          if (notifier.recipes.isEmpty) {
            return const EmptyRecipeMessage();
          }

          return ListView.builder(
            itemCount: notifier.recipes.length,
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              final recipe = notifier.recipes[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 4.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  leading: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    child: Icon(
                      Symbols.humidity_high,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  title: Text(
                    recipe.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    "Calculée le ${_formatDate(recipe.createdAt)} • ${recipe.totalWeight.toStringAsFixed(0)} g",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: const Icon(Symbols.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => RecipeDetailScreen(recipe: recipe),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const RecipeList();
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500, minWidth: 100),
              child: const Image(
                image: AssetImage('assets/png/Empty_recipe_small_res.png'),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Aucune recette n\'est calculée pour le moment.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Vous pouvez en créer une en cliquant sur "Créer sa ganache"',
              style: TextStyle(color: Colors.grey, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
