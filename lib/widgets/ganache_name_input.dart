// Retourne le nom de la ganache
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:ganache_lab/models/change_notifier_ganache_name_input.dart';

class GanacheNameInput extends StatefulWidget {
  const GanacheNameInput({super.key});

  @override
  _GanacheNameInputState createState() => _GanacheNameInputState();
}

class _GanacheNameInputState extends State<GanacheNameInput> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    // Initialisation du controller avec la valeur actuelle de TitleModel
    controller = TextEditingController(text: context.read<TitleModel>().title);
  }

  @override
  void dispose() {
    controller.dispose(); // Libération du controller pour éviter les fuites mémoire
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Utiliser context.watch pour que le widget se reconstruise lorsqu'il y a un changement
    final title = context.watch<TitleModel>().title;

    // On met à jour le texte du TextField si la valeur a changé dans le modèle
    if (controller.text != title) {
      controller.text = title;
    }

    return TextField(
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(Symbols.label, fill: 1),
        labelText: "Nom de la ganache",
        hintText: "Ex: Ganache au chocolat",
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) {
        context.read<TitleModel>().update(value);
      },
    );
  }
}
