// Ce fichier stock toutes les pages affichés lors du clique sur quelquonque indicators.
// Il étend les indactor pour permettre des explications plus approfondies.

// ATENTION trouver un moyen de générer les widgets et stocker les variables avec provider
import 'package:flutter/material.dart';
import 'package:ganache_lab/widgets/glossary_button.dart';

// TODO faire en sorte via provider de changer le nom de chaque appBar en fonction du nom de son "intinéraire de départ" (la route qui l'a emené ici).
// TODO faire également correspondre les icones aux cartes.

class ExtendedHumidity extends StatelessWidget {
  const ExtendedHumidity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.water_drop),
            const SizedBox(width: 5),
            const Text("Humidité"),
          ],
        ),
        actions: [
          // Ajouter ça aux trois autres indicators
         // Attention à la répétition !! (il y a son homonyme originel dans "welcome_screen.dart :5
          GlossaryButton(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Humiditée relativement élevée !",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text("63%", style: Theme.of(context).textTheme.displayLarge),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // TODO Ajouter le glossaire ou une description personnalisée qui parle de la texture
              children: [
                Text(
                  "Ceci est un texte d'explication qui sera attribué soit à une partie du glossaire, soit à une description personnalisée.",
                ),
                ListTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExtendedTexture extends StatelessWidget {
  const ExtendedTexture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.waves),
            const SizedBox(width: 5),
            const Text("Texture"),
          ],
        ),
        actions: [
          // Ajouter ça aux trois autres indicators
          // Attention à la répétition !! (il y a son homonyme originel dans "welcome_screen.dart :5
          GlossaryButton(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Texture ",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text("Fluide", style: Theme.of(context).textTheme.displayLarge),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // TODO Ajouter le glossaire ou une description personnalisée qui parle de la texture
              children: [
                Text(
                  "Ceci est un texte d'explication qui sera attribué soit à une partie du glossaire, soit à une description personnalisée.",
                ),
                ListTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExtendedSugarSweetening extends StatelessWidget {
  const ExtendedSugarSweetening({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.balance),
            const SizedBox(width: 5),
            const Text("Pouvoir sucrant"),
          ],
        ),
        actions: [
          // Ajouter ça aux trois autres indicators
          // Attention à la répétition !! (il y a son homonyme originel dans "welcome_screen.dart :5
          GlossaryButton(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Taux de pouvoir sucrant",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text("Modéré !", style: Theme.of(context).textTheme.displayLarge),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // TODO Ajouter le glossaire ou une description personnalisée qui parle de la texture
              children: [
                Text(
                  "Ceci est un texte d'explication qui sera attribué soit à une partie du glossaire, soit à une description personnalisée.",
                ),
                ListTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExtendedDLC extends StatelessWidget {
  const ExtendedDLC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.kitchen),
            const SizedBox(width: 5),
            const Text("Durée de vie"),
          ],
        ),
        actions: [
          // Ajouter ça aux trois autres indicators
          // Attention à la répétition !! (il y a son homonyme originel dans "welcome_screen.dart :5
          GlossaryButton(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Duré de vie",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text("3 mois", style: Theme.of(context).textTheme.displayLarge),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // TODO Ajouter le glossaire ou une description personnalisée qui parle de la texture
              children: [
                Text(
                  "Ceci est un texte d'explication qui sera attribué soit à une partie du glossaire, soit à une description personnalisée.",
                ),
                ListTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
