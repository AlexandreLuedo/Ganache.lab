// Widget pour la nature de la ganache (noir/lait/blanc)
import 'package:flutter/material.dart';

class GanacheTypeSelection extends StatefulWidget {
  const GanacheTypeSelection({super.key});

  @override
  State<GanacheTypeSelection> createState() => _GanacheTypeSelectionState();
}

class _GanacheTypeSelectionState extends State<GanacheTypeSelection> {
  int? chocolateTypeValue;
  final chocolateType = ["Noir", "Lait", "Noir/Lait", "Blanc", "Autre"];

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
              List<Widget>.generate(chocolateType.length, (int index) {
                return ChoiceChip(
                  label: Text(chocolateType[index]),
                  selected: chocolateTypeValue == index,
                  onSelected: (bool selected) {
                    setState(() {
                      chocolateTypeValue = selected ? index : null;
                      // Faire en sorte que chocolateTypeValue fonctionne avec provider.
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
