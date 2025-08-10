// Système pour affichage d'un glossaire d'informations à destination de l'utilisateur
// Il retourne glossary.md
import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class Glossary extends StatelessWidget {
  const Glossary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Glossaire")),
      body: MarkdownBlock(data: "test"),
    );

    // TODO Long terme: création d'un glossaire en utilisant un package de documentation (si dispo)
  }
}
