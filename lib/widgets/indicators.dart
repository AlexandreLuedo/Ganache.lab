// Ce fichier retourne les indicateurs/informations lors d'un calcul de ganache (d'où le nom indicators).
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ganache_lab/screens/screens_exportation_file.dart';
import 'package:provider/provider.dart';
import 'package:ganache_lab/services/calculation.dart';
import 'package:ganache_lab/services/aw.dart';

double indicatorsScale = 170;
double spacings = 20;

class Indicator extends StatelessWidget {
  const Indicator({super.key});

  @override
  Widget build(BuildContext context) {
    final recipe = context.watch<TotalModel>();

    // Real-time values from the analytical table
    final double humidityVal = recipe.waterPercentage * 100;
    final double fatVal = recipe.totalFatPercentage * 100;
    final double estVal = recipe.solidsPercentage * 100;
    final double sugarVal = recipe.sugarPercentage * 100;

    final humidity = humidityVal.toStringAsFixed(1);
    final fat = fatVal.toStringAsFixed(1);
    final sugar = recipe.sweeteningPower.toStringAsFixed(1);

    String sugarLabel = "Optimale";
    if (sugarVal < 25) sugarLabel = "Faible (<25%)";
    if (sugarVal > 30) sugarLabel = "Élevée";

    String textureLabel = "Fondante";
    if (humidityVal > 25) {
      textureLabel = "Trop Molle";
    } else if (humidityVal < 17) {
      textureLabel = "Trop Ferme";
    } else if (estVal < 75) {
      textureLabel = "Instable"; // Target EST is > 75%
    } else {
      textureLabel = "Équilibrée";
    }

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
          // Humidité indicator
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
                              style: const TextStyle(fontSize: 48),
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
                              decoration: BoxDecoration(
                                color:
                                    (humidityVal >= 17 && humidityVal <= 25)
                                        ? Colors.green
                                        : const Color(0xFFEB8C36),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                (humidityVal >= 17 && humidityVal <= 25)
                                    ? "OK"
                                    : "Vérif",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5.0),
                            const Expanded(
                              child: Text(
                                "Cible 17-25%",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
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
                    //                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.waves,
                            color: Colors.white,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Texture",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        textureLabel,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Sweetening Power
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
                              style: const TextStyle(fontSize: 45),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Icon(Icons.info, color: Color(0xFFEB8C36)),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Taux $sugarLabel",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Shelf Life
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
                            Icon(Icons.kitchen),
                            SizedBox(width: 4),
                            Text(
                              "Durée de vie",
                              style: TextStyle(fontSize: 19),
                            ),
                          ],
                        ),
                      ),
                      Consumer<TotalModel>(
                        builder: (context, model, child) {
                          double aw = model.awValue;
                          int days = AwService.getDaysFromAw(aw);
                          double months = days / 30;

                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      aw.toStringAsFixed(2),
                                      style: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      "Aw",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Env. ${months.toStringAsFixed(1)} mois",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "DLC",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 5.0),
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFEB8C36),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Text(
                                      AwService.getFormattedDate(days),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
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
