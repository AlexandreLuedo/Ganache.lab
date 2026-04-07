// Displays recipes via the db
import 'package:flutter/material.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';
import 'package:material_symbols_icons/symbols.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CreateFab(),
      appBar: AppBar(
        // centerTitle: true,
        title: const Text(
          'Recettes' /*,
        style: TextStyle(fontWeight: FontWeight.bold)*/,
        ),
      ),
      body: EmptyRecipeMessage()
    );
  }
}

class EmptyRecipeMessage extends StatelessWidget {
  const EmptyRecipeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 100),
          Icon(
            Symbols.menu_book_2,
            size: 250,
            color: Colors.grey,
            weight: 100,
          ),
          SizedBox(height: 100),
          Text(
            'Aucune recette n\'est calculée pour le moment. \n Vous pouvez en créer une en cliquant sur "Créer sa ganache"',
            style: TextStyle(color: Colors.grey, fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}