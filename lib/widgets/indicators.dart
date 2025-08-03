import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

double indicatorsScale = 170;
double spacings = 20;

class Indicator extends StatelessWidget {
  const Indicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // Humidité
          Container(
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
                      padding: EdgeInsets.only(
                        left: 10.0,
                        top: 4.0,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.water_drop),
                          SizedBox(width: 5),
                          Text("Humidité", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                        top: 0.0,
                        right: 0.0,
                        bottom: 0,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "28%",
                            style: TextStyle(
                              //  fontWeight: FontWeight.bold,
                              fontSize: 55,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                        top: 0.0,
                        right: 0.0,
                        bottom: 5,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            //height: 10,
                            //width: 10,
                            decoration: BoxDecoration(
                              color: Color(0xFFEB8C36),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              "16°",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 10.0), // Espacement horizontal
                          Expanded(child: Text("Point de rosé")),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            height: indicatorsScale,
            width: indicatorsScale,
            padding: EdgeInsets.all(6.5),
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
                      padding: EdgeInsets.only(top: 35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.waves, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            "Texture",
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Fluide",
                          style: TextStyle(
                            //  fontWeight: FontWeight.bold,
                            fontSize: 38,
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
          Container(
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
                      padding: EdgeInsets.only(top: 5.0, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.balance),
                          SizedBox(width: 5),
                          Expanded(child: Text(
                            "Pouvoir sucrant",
                            style: TextStyle(fontSize: 19),
                          ),),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child:
                            Text(
                              "86",
                              style: TextStyle(
                                //  fontWeight: FontWeight.bold,
                                fontSize: 45,
                              ),
                            ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child : Icon(Icons.info, color: Color(0xFFEB8C36))
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
          Container(
            height: indicatorsScale,
            width: indicatorsScale,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
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
                      padding: EdgeInsets.only(left: 9.0, top: 5.0),
                      child: Row(
                        children: [
                          // Icon(Icons.water_drop),
                          Icon(Icons.kitchen),
                          SizedBox(width: 4),
                          Text("Durée de vie", style: TextStyle(fontSize: 19)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0, bottom: 20.0),
                      child: Slider(
                        year2023: false,
                        value: 0.75,
                        onChanged: (value) {},
                        divisions: 4,
                        label: "03/08/2025",
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("DLC"),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5.0),
                          padding: const EdgeInsets.all(5),
                          //height: 10,
                          //width: 10,
                          decoration: BoxDecoration(
                            color: Color(0xFFEB8C36),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
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
