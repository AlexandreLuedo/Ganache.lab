import 'package:flutter/material.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: create_fab(),
      appBar: AppBar(
        // centerTitle: true,
        title: const Text(
          'Recettes' /*,
        style: TextStyle(fontWeight: FontWeight.bold)*/,
        ),
      ),
    );
  }
}