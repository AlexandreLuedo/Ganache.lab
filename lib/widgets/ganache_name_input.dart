// Retourne le nom de la ganache
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:ganache_lab/models/change_notifier_ganache_name_input.dart';

class GanacheNameInput extends StatelessWidget {
  const GanacheNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(
      text: context.read<TitleModel>().title,
    );

    return TextField(
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(Symbols.label, fill: 1),
        labelText: "Nom de la ganache",
        // TODO Implémenter ChocolateTypeValue remplace chocolat
        hintText: "Ex: Ganache au chocolat",
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) => context.read<TitleModel>().update(value),
    );
  }
}