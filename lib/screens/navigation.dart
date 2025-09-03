// Page principale contenant la navigationBar.
import 'package:flutter/material.dart';
import 'package:ganache_lab/screens/settings/settings_screens.dart';
import 'screens_exportation_file.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Color(0xFFEB8C36),
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Symbols.home, fill: 1, // Why this big boy doesn't get filled
                color: Colors.white),
            icon: const Icon(Symbols.home),
            label: 'Accueil',
          ),
          const NavigationDestination(
            selectedIcon: Icon(
              Symbols.menu_book, fill: 1,
              // Icons.collections_bookmark,
              color: Colors.white,
            ),
            icon: Icon(Icons.menu_book),
            label: 'Recettes',
          ),
          const NavigationDestination(
            selectedIcon: Icon(Symbols.settings, fill: 1, color: Colors.white),
            icon: Icon(Symbols.settings),
            label: 'Paramètres',
          ),
        ],
      ),
      body:
          <Widget>[
            OnWelcomeScreen(),
            // Gestuelle de glissement pour chaques cartouches de recettes : https://docs.flutter.dev/cookbook/gestures/dismissible
            // Quand l'on clique sur une recette : https://api.flutter.dev/flutter/material/ZoomPageTransitionsBuilder-class.html?_gl=1*1jeu0qs*_ga*NjY1MTkxNDE1LjE3NDg5NTI1NDc.*_ga_04YGWK0175*czE3NTMyNzE3MTAkbzgkZzEkdDE3NTMyNzE5MTIkajMxJGwwJGgw
            RecipeList(),
            SettingsScreen(),
          ][currentPageIndex],
    );
  }
}