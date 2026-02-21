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
    final Color background =
        color ?? Theme.of(context).colorScheme.primaryContainer;
    final Color resolvedBorderColor =
        borderColor ?? Theme.of(context).dividerColor;

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
                ? Border.all(width: borderWidth!, color: resolvedBorderColor)
                : null,
      ),
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }
}
