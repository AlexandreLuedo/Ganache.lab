// This file stores all the pages displayed when clicking on any indicators.
// It extends the indicators to allow more detailed explanations.

// WARNING find a way to generate the widgets and store the variables with provider
import 'package:flutter/material.dart';
import 'package:ganache_lab/widgets/glossary_button.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:ganache_lab/widgets/custom_container.dart';

// TODO make sure via provider to change the name of each appBar based on the name of its "starting itinerary" (the route that brought it here).
// TODO also match the icons to the cards.

class ExtendedHumidity extends StatelessWidget {
  const ExtendedHumidity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Symbols.water_drop),
            const SizedBox(width: 5),
            const Text("Humidité"),
          ],
        ),
        actions: [
          // Add this to the other three indicators
          // Beware of repetition !! (there is its original namesake in "welcome_screen.dart :5
          GlossaryButton(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          CustomContainer(
            margin: 0.0,
            padding: 10.0,
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: 20,
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
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: CustomContainer(
              margin: 0.0,
              padding: 10.0,
              color: Colors.transparent,
              borderColor: Theme.of(context).colorScheme.primary,
              borderWidth: 1.0,
              borderRadius: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // TODO Add the glossary or a custom description that talks about the texture
                children: [
                  Text(
                    "Ceci est un texte d'explication qui sera attribué soit à une partie du glossaire, soit à une description personnalisée.",
                  ),
                  ListTile(),
                ],
              ),
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
            const Icon(Symbols.waves),
            const SizedBox(width: 5),
            const Text("Texture"),
          ],
        ),
        actions: [
          // Add this to the other three indicators
          // Beware of repetition !! (there is its original namesake in "welcome_screen.dart :5
          GlossaryButton(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          CustomContainer(
            margin: 0.0,
            padding: 10.0,
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: 20,
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
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: CustomContainer(
              margin: 0.0,
              padding: 10.0,
              color: Colors.transparent,
              borderColor: Theme.of(context).colorScheme.primary,
              borderWidth: 1.0,
              borderRadius: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // TODO Add the glossary or a custom description that talks about the texture
                children: [
                  Text(
                    "Ceci est un texte d'explication qui sera attribué soit à une partie du glossaire, soit à une description personnalisée.",
                  ),
                  ListTile(),
                ],
              ),
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
            const Icon(Symbols.balance),
            const SizedBox(width: 5),
            const Text("Pouvoir sucrant"),
          ],
        ),
        actions: [
          // Add this to the other three indicators
          // Beware of repetition !! (there is its original namesake in "welcome_screen.dart :5
          GlossaryButton(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          CustomContainer(
            margin: 0.0,
            padding: 10.0,
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Taux de pouvoir sucrant",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "Modéré !",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: CustomContainer(
              margin: 0.0,
              padding: 10.0,
              color: Colors.transparent,
              borderColor: Theme.of(context).colorScheme.primary,
              borderWidth: 1.0,
              borderRadius: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // TODO Add the glossary or a custom description that talks about the texture
                children: [
                  Text(
                    "Ceci est un texte d'explication qui sera attribué soit à une partie du glossaire, soit à une description personnalisée.",
                  ),
                  ListTile(),
                ],
              ),
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
            const Icon(Symbols.kitchen),
            const SizedBox(width: 5),
            const Text("Durée de vie"),
          ],
        ),
        actions: [
          // Add this to the other three indicators
          // Beware of repetition !! (there is its original namesake in "welcome_screen.dart :5
          GlossaryButton(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          CustomContainer(
            margin: 0.0,
            padding: 10.0,
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: 20,
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
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: CustomContainer(
              margin: 0.0,
              padding: 10.0,
              color: Colors.transparent,
              borderColor: Theme.of(context).colorScheme.primary,
              borderWidth: 1.0,
              borderRadius: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // TODO Add the glossary or a custom description that talks about the texture
                children: [
                  Text(
                    "Ceci est un texte d'explication qui sera attribué soit à une partie du glossaire, soit à une description personnalisée.",
                  ),
                  ListTile(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
