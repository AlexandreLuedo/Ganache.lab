// Selectionneur d'utilisation de la ganache via des segmented buttons
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

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
        ),
      ],
    );
  }
}