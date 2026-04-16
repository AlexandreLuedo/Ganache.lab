// Widget pour la nature de la ganache (noir/lait/blanc)
import 'package:flutter/material.dart';
import 'package:ganache_lab/models/notifiers/chocolate_type_notifier.dart';
import 'package:ganache_lab/models/notifiers/weight_ganache_notifier.dart';
import 'package:ganache_lab/services/calculation.dart';
import 'package:ganache_lab/widgets/ganache_type_selection.dart';
import 'package:provider/provider.dart';

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
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
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
                      chocolateTypeValue =
                          selected ? index : null; // Just for UI
                    });
                    
                    final String? newValue = selected ? chocolateType[index] : null;
                    
                    // Update selection
                    final chocoModel = Provider.of<ChocolateTypeModel>(context, listen: false);
                    chocoModel.updateSelection(newValue);

                    // Trigger real-time calculation to update ingredients list
                    final totalModel = Provider.of<TotalModel>(context, listen: false);
                    final frame = Provider.of<FrameModel>(context, listen: false);
                    final mold = Provider.of<MoldModel>(context, listen: false);
                    final other = Provider.of<OtherModel>(context, listen: false);
                    final app = Provider.of<ApplicationModel>(context, listen: false);

                    totalModel.calculateTotal(frame, mold, other, app, chocoModel);
                  },
                );
              }).toList(),
        ),
      ],
    );
  }
}
