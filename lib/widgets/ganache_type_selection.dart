// Selectionneur d'utilisation de la ganache via des segmented buttons
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'custom_container.dart';

class ApplicationTypeSelection extends StatefulWidget {
  const ApplicationTypeSelection({super.key});

  @override
  State<ApplicationTypeSelection> createState() =>
      _ApplicationTypeSelectionState();
}

enum Application { moulage, cadrage, autre }

class _ApplicationTypeSelectionState extends State<ApplicationTypeSelection> {
  Application applicationView = Application.moulage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Type d'application",
          style: Theme
              .of(context)
              .textTheme
              .headlineSmall,
        ),
        SegmentedButton<Application>(
          segments: const <ButtonSegment<Application>>[
            ButtonSegment<Application>(
              value: Application.moulage,
              label: Text("Moulage"),
              icon: Icon(Symbols.apps),
            ),
            ButtonSegment<Application>(
              value: Application.cadrage,
              label: Text("Cadrage"),
              icon: Icon(Symbols.crop_square),
            ),
            ButtonSegment(
              value: Application.autre,
              label: Text("Autre"),
              icon: Icon(Symbols.more_horiz),
            ),
          ],
          selected: <Application>{applicationView},
          onSelectionChanged: (Set<Application> newSelection) {
            setState(() {
              applicationView = newSelection.first;
            });
          },
          emptySelectionAllowed: true,
        ),
        const SizedBox(height: 10),
        if (applicationView == Application.moulage)
          CustomContainer(borderWidth: 1, borderRadius: 12, child: Moulage())
        else
          if (applicationView == Application.cadrage)
            CustomContainer(borderWidth: 1, borderRadius: 12, child: Cadrage())
          else
            if (applicationView == Application.autre)
              CustomContainer(borderWidth: 1, borderRadius: 12, child: Autre())
      ],
    );
  }
}

class Moulage extends StatefulWidget {
  const Moulage({super.key});

  @override
  State<Moulage> createState() => _MoulageState();
}

class _MoulageState extends State<Moulage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Paramètres du moule",
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  prefixIcon: Icon(Symbols.scale, fill: 1),
                  border: OutlineInputBorder(),
                  labelText: "Poids par moule",
                  hintText: "Ex: 8g",
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  prefixIcon: Icon(Symbols.view_module, fill: 1),
                  border: OutlineInputBorder(),
                  labelText: "Nombre d'empreintes",
                  hintText: "Ex: 24",
                ),
              ),
            ),
          ],
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Paramètres du cadre",
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  prefixIcon: Icon(Symbols.open_in_full, fill: 1),
                  border: OutlineInputBorder(),
                  labelText: "Longueur - largeur",
                  hintText: "Ex: 12 cm",
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  prefixIcon: Icon(Symbols.height, fill: 1),
                  border: OutlineInputBorder(),
                  labelText: "Hauteur",
                  hintText: "Ex: 1.5",
                ),
              ),
            ),
          ],
        ),
        SizedBox( height: 10),
        TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              prefixIcon: Icon(Symbols.numbers, fill: 1),
              border: OutlineInputBorder(),
              labelText: "Nombre de cadres mis en œuvres",
              hintText: "Ex: 1",
            ),
          ),

      ],
    );
  }
}

class Autre extends StatelessWidget {
  const Autre({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Renseignez le poids total",
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        ),
        const SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            prefixIcon: Icon(Symbols.all_inclusive, fill: 1),
            border: OutlineInputBorder(),
            labelText: "Poids total de la ganache",
            hintText: "Ex: 1649g",
          ),
        ),

      ],
    );
  }
}