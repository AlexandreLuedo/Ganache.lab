import 'package:flutter/material.dart';

void main() => runApp(const GanacheApp());

class GanacheApp extends StatelessWidget {
  const GanacheApp({super.key});

  @override
  build(BuildContext context)
  {
    return MaterialApp(
        // debugShowCheckedModeBanner: false,
        theme: ThemeData(colorSchemeSeed: const Color(0xFFEB8C36)),
        home: const Navigation());
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});


  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.onlyShowSelected;

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
            selectedIcon: Icon(
                Icons.home,
              color: Colors.white,
            ),
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
            selectedIcon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
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
  State<ConcatenedFloatingActionButton> createState() => _ConcatenedFloatingActionButtonState();
}
class _ConcatenedFloatingActionButtonState extends State<ConcatenedFloatingActionButton> {
  build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: "createGanache",
      label: Text("Créer sa ganache"),
      icon: Icon(Icons.add),
      backgroundColor: Color(0xFFEB8C36),
      foregroundColor: Colors.white,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateGanache()),
        );
      },
    );
  }
}

class CreateGanache extends StatelessWidget {
  const CreateGanache({super.key});

  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Créer sa ganache"),
        actions: <Widget>[
          IconButton(
            onPressed: (){/* TODO implement card popup (found in textfields */},
            icon: Icon(Icons.help),
            tooltip: "Aide",
          ),
          ],

      ),
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
         ],
       )
      )
    );
  }
}
// Variables / Enum / Listes
enum Application {Moulage, Cadrage, Autre}

// Indentation pour signfier que les classes sous-jacentes sont appelés par CreateGanache.
// Classes
  class GanacheTypeSelection extends StatefulWidget {
  const GanacheTypeSelection({super.key});
  @override
  State<GanacheTypeSelection> createState() => _GanacheTypeSelectionState();
  }
  class _GanacheTypeSelectionState extends State<GanacheTypeSelection> {
  int? ChocolateTypeValue = 1;
  final noms = ["Noir", "Lait", "Noir/Lait", "Blanc", "Autre"];

@override
  Widget build(BuildContext context) {
  return
     Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Type de ganache", style: Theme.of(context).textTheme.headlineSmall),
            Wrap(
              spacing: 5.0,
              children:
              List<Widget>.generate(noms.length, (int index) {
                return ChoiceChip(
                  label: Text(noms[index]),
                  selected: ChocolateTypeValue == index,
                  onSelected: (bool selected) {
                    setState(() {
                      ChocolateTypeValue = selected ? index : null;
                      // _value = condition ? valeurSiVrai : valeurSiFaux;

                    });
                  },
                );
              }).toList(),
            ),
          ]
      );
}
}
  class GanacheNameInput extends StatelessWidget {
  const GanacheNameInput({super.key});
    @override
    Widget build(BuildContext context) {
      return
        TextField(
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
  State<ApplicationTypeSelection> createState() => _ApplicationTypeSelectionState();
}

class _ApplicationTypeSelectionState extends State<ApplicationTypeSelection> {
  Application applicationView = Application.Moulage;

  @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Type d'application", style: Theme.of(context).textTheme.headlineSmall),
          SegmentedButton<Application>(
              segments: const <ButtonSegment<Application>>[
                ButtonSegment<Application>(
                  value: Application.Moulage,
                  label: Text("Moulage"),
                  icon: Icon(Icons.apps)
                ),
                ButtonSegment<Application>(
                  value: Application.Cadrage,
                  label: Text("Cadrage"),
                  icon: Icon(Icons.crop_square)
                ),
                ButtonSegment(value: Application.Autre,
                  label: Text("Autre"),
                  icon: Icon(Icons.more_horiz)
                ),

  ],
    selected: <Application>{applicationView},
          onSelectionChanged: (Set<Application> newSelection) {
                setState(() {
                  applicationView = newSelection.first;
                });
    }),
      ]
      );
    }
}
  class OnWelcomeScreen extends StatelessWidget {
  const OnWelcomeScreen({super.key});
  build(BuildContext context) {
    return Scaffold(
      body:
        WelcomeScreen(),
      floatingActionButton:
        ConcatenedFloatingActionButton(),
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
          Text('Bienvenue dans',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ) // #enddocregion text
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Ganache',
                style: TextStyle(
                    color: Color(0xFF422322),
                    fontWeight: FontWeight.bold,
                    fontSize: 32
                ),
              ),
              Text('.lab',
                style: TextStyle(
                    color: Color(0xFFEB8C36),
                    fontWeight: FontWeight.bold,
                    fontSize: 32
                ),
              ),
            ],
          ),
        ],// #enddocregion centered-text
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
        title: const Text('Recettes'/*,
        style: TextStyle(fontWeight: FontWeight.bold)*/
        ),
      )
    );
  }
}
class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres')
      ),
    );
  }
}