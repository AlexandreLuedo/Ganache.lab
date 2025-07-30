import 'package:flutter/material.dart';

class GanacheNameInput extends StatelessWidget {
  const GanacheNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.edit),
        labelText: "Nom de la ganache",
        // TODO Implémenter ChocolateTypeValue remplace chocolat
        hintText: "Ganache au chocolat",
        border: OutlineInputBorder(),
      ),
    );
  }
}