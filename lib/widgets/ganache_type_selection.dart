// Selectionneur d'utilisation de la ganache via des segmented buttons
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'custom_container.dart';
import 'package:ganache_lab/models/weight_ganache_notifier.dart';

// Enum pour les types d'application
enum Application { moulage, cadrage, autre }

class ApplicationModel extends ChangeNotifier {
  Application _currentView = Application.moulage;
  Application get currentView => _currentView;

  void updateView(Application newView) {
    _currentView = newView;
    notifyListeners();
  }
}

// Widget principal
class ApplicationTypeSelection extends StatelessWidget {
  const ApplicationTypeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    // On écoute quelle est la vue actuelle
    final currentView = context.watch<ApplicationModel>().currentView;

    return Column(
      children: [
        SegmentedButton<Application>(
          segments: const [
            ButtonSegment(value: Application.moulage, label: Text("Moulage")),
            ButtonSegment(value: Application.cadrage, label: Text("Cadrage")),
            ButtonSegment(value: Application.autre, label: Text("Autre")),
          ],
          selected: {currentView}, // Utilise la vue du Provider
          onSelectionChanged: (selection) {
            // Met à jour la vue dans le Provider
            context.read<ApplicationModel>().updateView(selection.first);
          },
        ),
        const SizedBox(height: 20),

        // Affichage du bon widget selon la sélection
        if (currentView == Application.moulage)
          const CustomContainer(
            borderRadius: 12,
            borderWidth: 1,
            child: Moulage(),
          )
        else if (currentView == Application.cadrage)
          const CustomContainer(
            borderRadius: 12,
            borderWidth: 1,
            child: Cadrage(),
          )
        else
          const CustomContainer(
            borderRadius: 12,
            borderWidth: 1,
            child: Autre(),
          ),
      ],
    );
  }
}

class Moulage extends StatefulWidget {
  const Moulage({super.key});

  @override
  State<Moulage> createState() => _MoulageState();
}

@override
class _MoulageState extends State<Moulage> {
  late TextEditingController _weightController;
  late TextEditingController _numberMusslesController;
  late TextEditingController _numberMoldController;

  @override
  void initState() {
    super.initState();
    _weightController = TextEditingController(
      text: context.read<MoldModel>().weight.toString(),
    );
    _numberMusslesController = TextEditingController(
      text: context.read<MoldModel>().numberMussles.toString(),
    );
    _numberMoldController = TextEditingController(
      text: context.read<MoldModel>().numberMold.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Paramètres du moule",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _weightController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          decoration: const InputDecoration(
            prefixIcon: Icon(Symbols.scale, fill: 1),
            border: OutlineInputBorder(),
            labelText: "Poids par empreinte",
            hintText: "Ex: 8g",
          ),
          onChanged: (value) {
            final cleanValue = value.replaceAll(',', '.');
            var number = double.tryParse(cleanValue);
            if (number != null) {
              context.read<MoldModel>().updateWeight(number);
            } else {
              number = 0;
            }
          },
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _numberMusslesController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            prefixIcon: Icon(Symbols.view_module, fill: 1),
            border: OutlineInputBorder(),
            labelText: "Nombre d'empreinte par moule",
            hintText: "Ex: 24",
          ),
          onChanged: (value) {
            var number = int.tryParse(value);
            if (number != null) {
              context.read<MoldModel>().updateNumberMussles(number);
            } else {
              number = 0;
            }
          },
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _numberMoldController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          decoration: const InputDecoration(
            prefixIcon: Icon(Symbols.numbers, fill: 1),
            border: OutlineInputBorder(),
            labelText: "Nombre de moules",
            hintText: "Ex: 1",
          ),
          onChanged: (value) {
            final cleanValue = value.replaceAll(',', '.');
            var number = double.tryParse(cleanValue);
            if (number != null) {
              context.read<MoldModel>().updateNumberMold(number);
            } else {
              number = 0;
            }
          },
        ),
      ],
    );
  }
}

class Cadrage extends StatefulWidget {
  const Cadrage({super.key});

  @override
  State<Cadrage> createState() => _CadrageState();
}

class _CadrageState extends State<Cadrage> {
  late TextEditingController _lenghtController;
  late TextEditingController _widthController;
  late TextEditingController _heightController;
  late TextEditingController _numberFramesController;

  @override
  void initState() {
    super.initState();
    _lenghtController = TextEditingController(
      text: context.read<FrameModel>().lenght.toString(),
    );
    _widthController = TextEditingController(
      text: context.read<FrameModel>().width.toString(),
    );
    _heightController = TextEditingController(
      text: context.read<FrameModel>().height.toString(),
    );
    _numberFramesController = TextEditingController(
      text: context.read<FrameModel>().numberFrames.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Paramètres du cadre",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),

        TextField(
          controller: _lenghtController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          decoration: const InputDecoration(
            prefixIcon: Icon(Symbols.arrow_range, fill: 1),
            border: OutlineInputBorder(),
            labelText: "Longueur",
            hintText: "Ex: 12 cm",
          ),
          onChanged: (value) {
            final cleanValue = value.replaceAll(',', '.');
            var number = double.tryParse(cleanValue);
            if (number != null) {
              context.read<FrameModel>().updateLenght(number);
            } else {
              number = 0;
            }
          },
        ),
        const SizedBox(height: 10),

        TextField(
          controller: _widthController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          decoration: const InputDecoration(
            prefixIcon: Icon(Symbols.open_in_full, fill: 1),
            border: OutlineInputBorder(),
            labelText: "Largeur",
            hintText: "Ex: 12 cm",
          ),
          onChanged: (value) {
            final cleanValue = value.replaceAll(',', '.');
            var number = double.tryParse(cleanValue);
            if (number != null) {
              context.read<FrameModel>().updateWidth(number);
            } else {
              number = 0;
            }
          },
        ),

        const SizedBox(height: 10),
        TextField(
          controller: _heightController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          decoration: const InputDecoration(
            prefixIcon: Icon(Symbols.height, fill: 1),
            border: OutlineInputBorder(),
            labelText: "Hauteur",
            hintText: "Ex: 1.5",
          ),
          onChanged: (value) {
            final cleanValue = value.replaceAll(',', '.');
            var number = double.tryParse(cleanValue);
            if (number != null) {
              context.read<FrameModel>().updateHeight(number);
            } else {
              number = 0;
            }
          },
        ),

        SizedBox(height: 10),
        TextField(
          controller: _numberFramesController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          decoration: const InputDecoration(
            prefixIcon: Icon(Symbols.numbers, fill: 1),
            border: OutlineInputBorder(),
            labelText: "Nombre de cadres mis en œuvres",
            hintText: "Ex: 1",
          ),
          onChanged: (value) {
            final cleanValue = value.replaceAll(',', '.');
            var number = double.tryParse(cleanValue);
            if (number != null) {
              context.read<FrameModel>().updateNumberFrames(number);
            } else {
              number = 0;
            }
          },
        ),
      ],
    );
  }
}

class Autre extends StatefulWidget {
  const Autre({super.key});

  @override
  State<Autre> createState() => _AutreState();
}

class _AutreState extends State<Autre> {
  late TextEditingController _totalWeightController;

  @override
  void initState() {
    super.initState();
    _totalWeightController = TextEditingController(
      text: context.read<OtherModel>().otherWeight.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Poids total", // "Renseignez le poids total",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _totalWeightController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          decoration: const InputDecoration(
            prefixIcon: Icon(Symbols.all_inclusive, fill: 1),
            border: OutlineInputBorder(),
            labelText: "Poids total de la ganache",
            hintText: "Ex: 1649g",
          ),
          onChanged: (value) {
            final cleanValue = value.replaceAll(',', '.');
            var number = double.tryParse(cleanValue);
            if (number != null) {
              context.read<OtherModel>().updateTotalOther(number);
            } else {
              number = 0;
            }
          },
        ),
      ],
    );
  }
}
