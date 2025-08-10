// Affiche le bouton glossaire
import 'package:flutter/material.dart';
import 'package:ganache_lab/screens/glossary.dart';

class GlossaryButton extends StatelessWidget {
  const GlossaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Glossary()),
        );
      },
      icon: IconButton(
        color: Theme.of(context).colorScheme.tertiary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Glossary()),
          );
        },
        icon: const Icon(Icons.book_outlined),
        tooltip: "Glossaire",
      ),
    );
  }
}
