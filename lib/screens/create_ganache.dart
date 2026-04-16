// Affiche la création de ganache.
// Appel les différents widgets de paramétrage pour la ganache ~/ganache_dot_first/lib/widgets/...
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ganache_lab/models/notifiers/ganache_title_notifier.dart';
import 'package:ganache_lab/models/notifiers/chocolate_type_notifier.dart';
import 'package:ganache_lab/models/notifiers/weight_ganache_notifier.dart';
import 'package:ganache_lab/models/notifiers/temperature_notifier.dart';
import 'package:ganache_lab/services/calculation.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'calculate_ganache.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';
import 'package:ganache_lab/widgets/ganache_type_selection.dart';

class CreateGanache extends StatefulWidget {
  const CreateGanache({super.key});

  @override
  State<CreateGanache> createState() => _CreateGanacheState();
}

class _CreateGanacheState extends State<CreateGanache> {
  double progressValue = 0.0;
  Key _formKey = UniqueKey();

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
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Ferme le dialog
                        },
                        child: const Text("Fermer"),
                      ),
                      FilledButton.icon(
                        onPressed: () {
                          // Ferme le dialog
                          _launchUrl();
                        },
                        icon: const Icon(Symbols.open_in_new),
                        label: const Text("Visiter la page d'aide"),
                        iconAlignment: IconAlignment.end,
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Symbols.help_outline),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value: progressValue,
            backgroundColor: Colors.grey,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFEB8C36)),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Row(
          children: [
            IconButton(
              tooltip: "Rechercher des ingrédients",
              icon: const Icon(Symbols.search),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Rechercher un Ingrédient"),
                      content: const Text(
                        "",
                      ),
                      actions: <Widget>[
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Ferme le dialog
                            _launchUrl(); // )
                          },
                          child: const Text("Rechercher"),
                        ),
                        FilledButton(
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
                        // TODO Implement cancel
                      },
                    ),
                  ),
                );
              },
              icon: const Icon(Symbols.bookmark_add, fill: 1),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            heroTag: "resetFields",
            tooltip: "Réinitialiser les champs",
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
            onPressed: () {
              // Reset all models except temperature
              context.read<TotalModel>().reset();
              context.read<TitleModel>().reset();
              context.read<ChocolateTypeModel>().reset();
              context.read<FrameModel>().reset();
              context.read<MoldModel>().reset();
              context.read<OtherModel>().reset();
              context.read<ApplicationModel>().reset();

              // Force reconstruction of the view to clear TextFields
              setState(() {
                _formKey = UniqueKey();
              });

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Champs réinitialisés")),
              );
            },
            child: const Icon(Symbols.restart_alt),
          ),
          const SizedBox(height: 12),
          FloatingActionButton.extended(
            heroTag: "Calcule",
            label: const Text("Calculer"),
            icon: const Icon(Symbols.calculate, fill: 1),
            backgroundColor: const Color(0xFFEB8C36),
            foregroundColor: Colors.white,
            onPressed: () {
              final frame = context.read<FrameModel>();
              final mold = context.read<MoldModel>();
              final other = context.read<OtherModel>();
              final app = context.read<ApplicationModel>();
              final totalCocoaButter = context.read<ChocolateTypeModel>();

              context.read<TotalModel>().calculateTotal(
                frame,
                mold,
                other,
                app,
                totalCocoaButter,
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CalculateGanache()),
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: ListView(
        key: _formKey,
        padding: const EdgeInsets.all(16),
        children: const [
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
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const FabricationTemperatureSelector(),
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
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: context.read<TemperatureModel>().temperature.toStringAsFixed(0),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: const InputDecoration(
        prefixIcon: Icon(Symbols.device_thermostat),
        border: OutlineInputBorder(),
        labelText: "Renseignez la température °C",
        hintText: "Ex: 32°C",
      ),
      onChanged: (value) {
        var number = double.tryParse(value);
        if (number != null) {
          context.read<TemperatureModel>().updateTemperature(number);
        }
      },
    );
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
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const DropdownMenu(
          enableFilter: true,
          leadingIcon: Icon(Symbols.design_services, fill: 1),
          label: Text("Selectionnez la méthode de fabrication"),
          dropdownMenuEntries: [
            DropdownMenuEntry(value: Placeholder(), label: "Méthode 1"),
          ],
        ),
      ],
    );
  }
}
