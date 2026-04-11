// Ce fichier retourne les indicateurs/informations lors d'un calcul de ganache (d'où le nom indicators).
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ganache_lab/screens/screens_exportation_file.dart';
import 'package:provider/provider.dart';
import 'package:ganache_lab/services/calculation.dart';

double indicatorsScale = 170;
double spacings = 20;

class Indicator extends StatelessWidget {
  const Indicator({super.key});

  @override
  Widget build(BuildContext context) {
    final recipe = context.watch<TotalModel>();
    // For MVP, we use standard values based on our fixed ratio generated recipe
    final humidity = "28"; // ~28% d'eau dans une crème 35% MG
    final fat = 16.0; // 16% de MG est équilibré
    final sugar = "86";

    String textureLabel = "Équilibré";
    if (fat < 13) textureLabel = "Maigre";
    if (fat > 18) textureLabel = "Gras";

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(6.3),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Wrap(
        spacing: spacings,
        runSpacing: spacings,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExtendedHumidity(),
                ),
              );
            },
            child: Container(
              height: indicatorsScale,
              width: indicatorsScale,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipPath(
                      clipper: RoundedRectClipper(),
                      child: SvgPicture.asset(
                        'assets/svg/LittleWave.svg',
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primaryContainer,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 4.0),
                        child: const Row(
                          children: [
                            Icon(Icons.water_drop),
                            SizedBox(width: 5),
                            Text("Humidité", style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Text(
                              "$humidity%",
                              style: const TextStyle(
                                //  fontWeight: FontWeight.bold,
                                fontSize: 55,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, bottom: 5),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              //height: 10,
                              //width: 10,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEB8C36),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Text(
                                "16°",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            // Espacement horizontal
                            const Expanded(child: Text("Point de rosé")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Texture
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExtendedTexture()),
              );
            },
            child: Container(
              height: indicatorsScale,
              width: indicatorsScale,
              padding: const EdgeInsets.all(6.5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/svg/cookie12.svg',
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.waves, color: Colors.white),
                            const SizedBox(width: 5),
                            Text(
                              "Texture",
                              style: const TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            textureLabel,
                            style: const TextStyle(
                              //  fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExtendedSugarSweetening(),
                ),
              );
            },
            child: SizedBox(
              height: indicatorsScale,
              width: indicatorsScale,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    // fit: BoxFit.cover,
                    'assets/svg/testcookie4.svg',
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.surfaceContainer,
                      BlendMode.srcIn,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, left: 10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.balance),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                "Pouvoir sucrant",
                                style: TextStyle(fontSize: 19),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              sugar,
                              style: const TextStyle(
                                //  fontWeight: FontWeight.bold,
                                fontSize: 45,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Icon(Icons.info, color: Color(0xFFEB8C36)),
                          ),
                          SizedBox(width: 5),
                          Text("Taux modéré"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExtendedDLC()),
              );
            },
            child: Container(
              height: indicatorsScale,
              width: indicatorsScale,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipPath(
                      clipper: RoundedRectClipper(),
                      child: SvgPicture.asset(
                        'assets/svg/very_sunny.svg',
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 9.0, top: 5.0),
                        child: const Row(
                          children: [
                            // Icon(Icons.water_drop),
                            Icon(Icons.kitchen),
                            SizedBox(width: 4),
                            Text(
                              "Durée de vie",
                              style: TextStyle(fontSize: 19),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, bottom: 20.0),
                        child: Slider(
                          year2023: false,
                          value: 0.75,
                          onChanged: (value) {},
                          divisions: 4,
                          label: "3 mois",
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("DLC"),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5.0),
                            padding: const EdgeInsets.all(5),
                            //height: 10,
                            //width: 10,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEB8C36),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Text(
                              "03/08/2025",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedRectClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addRRect(
      RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(20)),
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
