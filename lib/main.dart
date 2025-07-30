import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const GanacheApp());

class GanacheApp extends StatelessWidget {
  const GanacheApp({super.key});

  @override
  build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: const Color(0xFFEB8C36)),
      home: const Navigation(),
    );
  }
}

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
              Icons.menu_book,
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

class ConcatenedFloatingActionButton extends StatefulWidget {
  const ConcatenedFloatingActionButton({super.key});

  @override
  State<ConcatenedFloatingActionButton> createState() =>
      _ConcatenedFloatingActionButtonState();
}

class _ConcatenedFloatingActionButtonState
    extends State<ConcatenedFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: "createGanache",
      label: const Text("Créer sa ganache"),
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateGanache()),
        );
      },
      backgroundColor: Color(0xFFEB8C36),
      foregroundColor: Colors.white,
    );
  }
}

class CreateGanache extends StatefulWidget {
  const CreateGanache({super.key});

  @override
  State<CreateGanache> createState() => _CreateGanacheState();
}

class _CreateGanacheState extends State<CreateGanache> {
  double progressValue = 0.0;

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Créer sa ganache"),
        actions: <Widget>[
          IconButton(
            tooltip: "Centre d'aide",
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Aide"),
                    content: const Text(
                      "Dans cette page vous devez compléter toutes les informations proposés. \n Il n'est pas encore possible d'ajouter ses propres paramètres. \n Pour plus d'informations veuillez vous rendre sur le site internet.",
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Ferme le dialog
                          _launchUrl(); // )
                        },
                        child: const Text("Visiter la page d'aide"),
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
            icon: const Icon(Icons.help_outline),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value: progressValue,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEB8C36)),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Row(
          children: [
            IconButton(
              tooltip: "Rechercher des ingrédients",
              icon: const Icon(Icons.search),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Rechercher un Ingrédient"),
                      content: const Text(
                        /* TODO Ajouter la recherche d\'ingrédients */ "",
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Ferme le dialog
                            _launchUrl(); // )
                          },
                          child: const Text("Rechercher"),
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
            ),
            IconButton(
              tooltip: "Sauvegarder le brouillon",
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Brouillon Sauvegardé !"),
                    action: SnackBarAction(
                      label: 'Annuler',
                      onPressed: () {
                        // TODO Implémenter annuler
                      },
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.bookmark_add),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "Calcule",
        tooltip: "Calculer la Ganache",
        label: Text("Calculer"),
        icon: Icon(Icons.calculate),
        backgroundColor: Color(0xFFEB8C36),
        foregroundColor: Colors.white,
        onPressed: () {
          /* TODO Créer la route pour aller sur la page CalculateGanache */
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GanacheNameInput(),
            SizedBox(height: 16),
            GanacheTypeSelection(),
            SizedBox(height: 16),
            ApplicationTypeSelection(),
            SizedBox(height: 16),
            GanacheIngredients(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

//
// class CalculateGanache extends StatefulWidget {
//   const CalculateGanache({super.key});
//
//   @override
//   State<CalculateGanache> createState() => _CalculateGanacheState();
// }
//
// class _CalculateGanacheState extends State<CalculateGanache> {
//   @override
//   Widget build(BuildContext context) {}
// }
//
// Variables / Enum / Listes
enum Application { moulage, cadrage, autre }

// Indentation pour signfier que les classes sous-jacentes sont appelés par CreateGanache.
// Classes
class GanacheTypeSelection extends StatefulWidget {
  const GanacheTypeSelection({super.key});

  @override
  State<GanacheTypeSelection> createState() => _GanacheTypeSelectionState();
}

class _GanacheTypeSelectionState extends State<GanacheTypeSelection> {
  int? chocolateTypeValue = 1;
  final noms = ["Noir", "Lait", "Noir/Lait", "Blanc", "Autre"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Type de ganache",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Wrap(
          spacing: 5.0,
          children:
              List<Widget>.generate(noms.length, (int index) {
                return ChoiceChip(
                  label: Text(noms[index]),
                  selected: chocolateTypeValue == index,
                  onSelected: (bool selected) {
                    setState(() {
                      chocolateTypeValue = selected ? index : null;
                      // _value = condition ? valeurSiVrai : valeurSiFaux;
                    });
                  },
                );
              }).toList(),
        ),
      ],
    );
  }
}

class GanacheNameInput extends StatelessWidget {
  const GanacheNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.edit),
        labelText: "Nom de la ganache",
        // TODO Implémenter ChocolateTypeValue remplace chocolat
        hintText: "Ganache au chocolat",
        border: OutlineInputBorder(),
      ),
    );
  }
}

class ApplicationTypeSelection extends StatefulWidget {
  const ApplicationTypeSelection({super.key});

  @override
  State<ApplicationTypeSelection> createState() =>
      _ApplicationTypeSelectionState();
}

class _ApplicationTypeSelectionState extends State<ApplicationTypeSelection> {
  Application applicationView = Application.moulage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Type d'application",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SegmentedButton<Application>(
          segments: const <ButtonSegment<Application>>[
            ButtonSegment<Application>(
              value: Application.moulage,
              label: Text("Moulage"),
              icon: Icon(Icons.apps),
            ),
            ButtonSegment<Application>(
              value: Application.cadrage,
              label: Text("Cadrage"),
              icon: Icon(Icons.crop_square),
            ),
            ButtonSegment(
              value: Application.autre,
              label: Text("Autre"),
              icon: Icon(Icons.more_horiz),
            ),
          ],
          selected: <Application>{applicationView},
          onSelectionChanged: (Set<Application> newSelection) {
            setState(() {
              applicationView = newSelection.first;
            });
          },
        ),
      ],
    );
  }
}

class GanacheIngredients extends StatelessWidget {
  const GanacheIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemple de données d’ingrédients
    final ingredients = [
      {'title': 'Chocolat', 'subtitle': 'Callebaut 58% min.', 'value': 1000},
      {'title': 'Crème', 'subtitle': '35% MG', 'value': 900},
      // Ajoute d’autres si besoin…
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
                        /* TODO Ajouter l\'ajout d\'ingrédients */ "",
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
              icon: const Icon(Icons.add),
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
              leading: const Icon(Icons.widgets),
              title: Text("${ingredient['title']}"),
              subtitle: Text("${ingredient['subtitle']}"),
              trailing: Text(
                "${ingredient['value']}g",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          );
        }),
      ],
    );
  }
}

class OnWelcomeScreen extends StatelessWidget {
  const OnWelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeScreen(),
      floatingActionButton: ConcatenedFloatingActionButton(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  build(BuildContext context) {
    return const Center(
      // #docregion text
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Bienvenue dans',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ), // #enddocregion text
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ganache',
                style: TextStyle(
                  color: Color(0xFF422322),
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Text(
                '.lab',
                style: TextStyle(
                  color: Color(0xFFEB8C36),
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ], // #enddocregion centered-text
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ConcatenedFloatingActionButton(),
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

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      // TODO Adding dark theme (SearrchBar class doc)
    );
  }
}
