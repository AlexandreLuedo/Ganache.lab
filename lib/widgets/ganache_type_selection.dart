// Selectionneur d'utilisation de la ganache via des segmented buttons
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'custom_container.dart';
import 'package:ganache_lab/models/change_notifier.dart';

// Enum pour les types d'application
enum Application { moulage, cadrage, autre }

// Widget principal
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
      children: [
        SegmentedButton<Application>(
          segments: const [
            ButtonSegment(value: Application.moulage, label: Text("Moulage")),
            ButtonSegment(value: Application.cadrage, label: Text("Cadrage")),
            ButtonSegment(value: Application.autre, label: Text("Autre")),
          ],
          selected: {applicationView},
          onSelectionChanged: (selection) {
            setState(() => applicationView = selection.first);
          },
        ),
        const SizedBox(height: 20),
        // Affiche les widgets Pour le paramétrage, cadrage, moulage et autre.
        if (applicationView == Application.moulage)
          CustomContainer(borderRadius: 12, borderWidth: 1, child: Moulage())
        else if (applicationView == Application.cadrage)
          CustomContainer(borderRadius: 12, borderWidth: 1, child: Cadrage())
        else
          CustomContainer(borderRadius: 12, borderWidth: 1, child: Autre()),
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
  late TextEditingController _numberMouleController;
  @override
  void initState() {
    super.initState();
    _weightController = TextEditingController(
      text: context.read<MouleModel>().weight.toString(),
    );
    _numberMusslesController = TextEditingController(
      text: context.read<MouleModel>().numberMussles.toString(),
    );
    _numberMouleController = TextEditingController(
      text: context.read<MouleModel>().numberMoule.toString(),
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
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            prefixIcon: Icon(Symbols.scale, fill: 1),
            border: OutlineInputBorder(),
            labelText: "Empreinte",
            hintText: "Ex: 8g",
          ),
          onChanged: (value) {
            final number = int.tryParse(value);
            if (number != null) {
              context.read<MouleModel>().updateWeight(number);
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
            labelText: "Nomb. Empreintes",
            hintText: "Ex: 24",
          ),
          onChanged: (value) {
            final number1 = int.tryParse(value);
            if (number1 != null) {
              context.read<MouleModel>().updateNumberMussles(number1);
            }
          },
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _numberMouleController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            prefixIcon: Icon(Symbols.numbers, fill: 1),
            border: OutlineInputBorder(),
            labelText: "Nombre de moules mis en œuvres mis en œuvres",
            hintText: "Ex: 1",
          ),
          onChanged: (value) {
            final number3 = int.tryParse(value);
            if (number3 != null) {
              context.read<MouleModel>().updateNumberMoule(number3);
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
  late TextEditingController _heightController;
  late TextEditingController _numberCadresController;

  @override
  void initState() {
    super.initState();
    _lenghtController = TextEditingController(
      text: context.read<CadreModel>().lenght.toString(),
    );
    _heightController = TextEditingController(
      text: context.read<CadreModel>().height.toString(),
    );
    _numberCadresController = TextEditingController(
      text: context.read<CadreModel>().numberCadres.toString(),
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
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _lenghtController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  prefixIcon: Icon(Symbols.open_in_full, fill: 1),
                  border: OutlineInputBorder(),
                  labelText: "Longueur - largeur",
                  hintText: "Ex: 12 cm",
                ),
                onChanged: (value) {
                  final number = double.tryParse(value);
                  if (number != null) {
                    context.read<CadreModel>().updateLenght(number);
                  }
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  prefixIcon: Icon(Symbols.height, fill: 1),
                  border: OutlineInputBorder(),
                  labelText: "Hauteur",
                  hintText: "Ex: 1.5",
                ),
                onChanged: (value) {
                  final number2 = double.tryParse(value);
                  if (number2 != null) {
                    context.read<CadreModel>().updateHeight(number2);
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextField(
          controller: _numberCadresController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            prefixIcon: Icon(Symbols.numbers, fill: 1),
            border: OutlineInputBorder(),
            labelText: "Nombre de cadres mis en œuvres",
            hintText: "Ex: 1",
          ),
          onChanged: (value) {
            final number3 = int.tryParse(value);
            if (number3 != null) {
              context.read<CadreModel>().updateNumberCadres(number3);
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
      text: context.read<AutreModel>().totalWeight.toString(),
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
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            prefixIcon: Icon(Symbols.all_inclusive, fill: 1),
            border: OutlineInputBorder(),
            labelText: "Poids total de la ganache",
            hintText: "Ex: 1649g",
          ),
          onChanged: (value) {
            final number3 = int.tryParse(value);
            if (number3 != null) {
              context.read<AutreModel>().updateTotalAutre(number3);
            }
          },
        ),
      ],
    );
  }
}
