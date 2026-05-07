import 'package:flutter/material.dart';
import 'package:ganache_lab/services/calculation.dart';
import 'package:ganache_lab/widgets/custom_container.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:ganache_lab/widgets/animated_count_text.dart';

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
              Icon(
                Symbols.all_inclusive,
                fill: 1,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Text(
                "Poids total",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          AnimatedCountText(
            value: total,
            suffix: "g",
            decimals: 3,
            style: const TextStyle(fontSize: 45),
            duration: const Duration(milliseconds: 600),
          ),
        ],
      ),
    );
  }
}
