// Affiche la création de ganache.
// Appel les différents widgets de paramétrage pour la ganache ~/ganache_dot_first/lib/widgets/...
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'calculate_ganache.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';

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
                      "Dans la page \"Créer sa ganache\", vous devez compléter toutes les informations proposés. \n Il n'est pas encore possible d'ajouter ses propres paramètres. \n Pour plus d'informations veuillez vous rendre sur le site internet.",
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Ferme le dialog
                          _launchUrl();
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
                        /* TODO Ajouter la recherche d\'ingrédients */
                        "",
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CalculateGanache()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          GanacheNameInput(),
          SizedBox(height: 16),
          GanacheTypeSelection(),
          SizedBox(height: 16),
          ApplicationTypeSelection(),
          SizedBox(height: 16),
          FabricationTemperature(),
          SizedBox(height: 16),
          FabricationMethod(),
          SizedBox(height: 16),
          GanacheIngredients(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class FabricationTemperature extends StatelessWidget {
  const FabricationTemperature({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Température d'utilisation",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        FabricationTemperatureSelector(),
      ],
    );
  }
}

class FabricationTemperatureSelector extends StatefulWidget {
  const FabricationTemperatureSelector({super.key});

  @override
  _FabricationTemperatureSelector createState() =>
      _FabricationTemperatureSelector();
}

class _FabricationTemperatureSelector
    extends State<FabricationTemperatureSelector> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
        ],
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.device_thermostat),
        border: OutlineInputBorder(),
        labelText: "Ex: 32°C",
      )
    );
      // Text field
      /* keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], */
  }
}

class FabricationMethod extends StatelessWidget {
  const FabricationMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Méthode de fabrication",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 10),
        DropdownMenu(
          enableFilter: true,
          label: const Text("Selectionnez la méthode de fabrication"),
          dropdownMenuEntries: [
            DropdownMenuEntry(value: Placeholder(), label: "Méthode 1"),
            // TODO https://api.flutter.dev/flutter/material/DropdownMenu-class.html
          ],
        ),
      ],
    );
  }
}
