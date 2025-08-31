import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Color? color; // couleur de fond (optionnelle)
  final double padding; // padding interne
  final double margin; // margin externe
  final double borderRadius; // rayon des coins
  final double? borderWidth; // épaisseur de la bordure (facultatif)
  final Color? borderColor; // couleur de la bordure (facultatif)
  final Widget child;
  final double? width; // largeur fixe (optionnelle)
  final double? height; // hauteur fixe (optionnelle)

  const CustomContainer({
    super.key,
    this.color,
    this.padding = 20.0,
    this.margin = 10.0,
    this.borderRadius = 1.0,
    this.borderWidth,
    this.borderColor,
    this.width,
    this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final Color background = color ?? Theme.of(context).colorScheme.primaryContainer;
    final Color backgroundColor = borderColor ?? Theme.of(context).dividerColor;

    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),

      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(borderRadius),
        border:
            borderWidth != null
                ? Border.all(width: borderWidth!, color: backgroundColor)
                : null,
      ),
      // Coupe le contenu qui dépasse les coins arrondis.
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }
}

/* DOC
Column(
  children: [
    CustomContainer(
      child: Text('Texte 1'),
    ),
    CustomContainer(
      color: Colors.amber,
      padding: 20.0,
      child: Text('Texte 2 avec plus de padding'),
    ),
    CustomContainer(
      margin: 0,
      child: Icon(Icons.star, size: 40),
    ),
  ],
);

 */