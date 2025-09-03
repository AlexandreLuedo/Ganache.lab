import 'package:flutter/material.dart';

class ListItem {
  final Widget? leading;
  final String title;
  final String subtitle;
  final bool isClickable;
  final void Function(BuildContext context)? onTap;

  ListItem({
    this.leading,
    required this.title,
    this.subtitle = '',
    this.isClickable = true,
    this.onTap,
  });
}

// class CustomContainer {
//   final Color? color; // couleur de fond (optionnelle)
//   final double padding; // padding interne
//   final double margin; // margin externe
//   final double borderRadius; // rayon des coins
//   final double? borderWidth; // épaisseur de la bordure (facultatif)
//   final Color? borderColor; // couleur de la bordure (facultatif)
//   final Widget child;
//   final double? width; // largeur fixe (optionnelle)
//   final double? height; // hauteur fixe (optionnelle)
//
//   const CustomContainer({
//   this.color,
//   this.padding = 20.0,
//   this.margin = 10.0,
//   this.borderRadius = 1.0,
//   this.borderWidth,
//   this.borderColor,
//   this.width,
//   this.height,
//   required this.child,
// });
//       }

class CustomContainerItem {
  final String title;
  final String subtitle;
  final IconData? icon;
  final Color? color;
  final void Function()? onTap;

  CustomContainerItem({
    required this.title,
    required this.subtitle,
    this.icon,
    this.color,
    this.onTap,
  });
}