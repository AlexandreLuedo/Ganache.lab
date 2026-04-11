import 'package:flutter/material.dart';
import 'package:ganache_lab/services/calculation.dart';
import 'package:ganache_lab/widgets/custom_container.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

class TotalWeightGanache extends StatelessWidget {
  const TotalWeightGanache({super.key});

  @override
  Widget build(BuildContext context) {
    final double total = context.watch<TotalModel>().total;

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
            "${total.toStringAsFixed(3)}g",
            style: const TextStyle(fontSize: 45),
          ),
        ],
      ),
    );
  }
}
