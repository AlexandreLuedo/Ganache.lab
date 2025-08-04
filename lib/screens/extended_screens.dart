import 'package:flutter/material.dart';

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
      ),
    );
  }
}
