import 'package:flutter/material.dart';
import 'package:ganache_lab/models/weight_setting_notifier.dart';
import 'package:ganache_lab/widgets/custom_container.dart';
import 'package:ganache_lab/widgets/ganache_type_selection.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

class TotalWeightGanache extends StatelessWidget {
  const TotalWeightGanache({super.key});

  @override
  Widget build(BuildContext context) {
    // Getting values
    final int mold = context.watch<MoldModel>().moldResult;
    final double frame = context.watch<FrameModel>().frameResult;
    final int other = context.watch<OtherModel>().otherWeight;

    // Active view in "Create ganache"
    final currentView = context.watch<ApplicationModel>().currentView;

    double total = 0.000;

    // Add the right value to the total with the view of Create ganache
    if (currentView == Application.moulage) {
      total = mold.toDouble();
    } else if (currentView == Application.cadrage) {
      total = frame;
    } else if (currentView == Application.autre) {
      total = other.toDouble();
    }

    return CustomContainer(
      borderRadius: 12,
      borderWidth: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Symbols.all_inclusive, fill: 1),
              const SizedBox(width: 10),
              Text(
                "Poids total",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          SelectableText(
            total.toStringAsFixed(3),
            style: const TextStyle(fontSize: 45),
          ),
        ],
      ),
    );
  }
}
