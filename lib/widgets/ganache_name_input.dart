// Retourne le nom de la ganache
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:ganache_lab/models/change_notifier.dart';

class GanacheNameInput extends StatefulWidget {
  const GanacheNameInput({super.key});

  @override
  _GanacheNameInputState createState() => _GanacheNameInputState();
}

class _GanacheNameInputState extends State<GanacheNameInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // Initialisation du controller avec la valeur de TitleModel
    _controller = TextEditingController(text: context.read<TitleModel>().title);
  }

  @override
  void dispose() {
    _controller.dispose(); // Libération du controller pour éviter des fuites mémoire
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Observer les changements de `TitleModel`
    final title = context.watch<TitleModel>().title;

    // Si la valeur de `TitleModel` change, mettre à jour le TextEditingController
    if (_controller.text != title) {
      _controller.text = title;
    }

    return TextField(
      controller: _controller,
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
