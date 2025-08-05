import 'package:flutter/material.dart';
import 'screens_exportation_file.dart';

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
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.white),
            icon: Icon(Icons.home_outlined),
            label: 'Accueil',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.menu_book_outlined,
              // Icons.collections_bookmark,
              color: Colors.white,
            ),
            icon: Icon(Icons.menu_book_outlined),
            label: 'Recettes',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings, color: Colors.white),
            icon: Icon(Icons.settings_outlined),
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
            Settings(),
          ][currentPageIndex],
    );
  }
}