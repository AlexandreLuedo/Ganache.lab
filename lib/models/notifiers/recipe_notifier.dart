import 'package:flutter/material.dart';
import '../recipe.dart';

class RecipeNotifier extends ChangeNotifier {
  final List<Recipe> _recipes = [];

  List<Recipe> get recipes => List.unmodifiable(_recipes);

  void addRecipe(Recipe recipe) {
    _recipes.insert(0, recipe);
    notifyListeners();
  }

  void removeRecipe(String id) {
    _recipes.removeWhere((r) => r.id == id);
    notifyListeners();
  }
}
