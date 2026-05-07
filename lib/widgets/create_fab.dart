// FAB "+ Créer sa ganache"
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ganache_lab/screens/create_ganache.dart';
import 'package:material_symbols_icons/symbols.dart';

class CreateFab extends StatelessWidget {
  const CreateFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: "createGanacheMain",
      label: const Text("Créer sa ganache"),
      icon: const Icon(Symbols.add),
      onPressed: () {
        HapticFeedback.lightImpact();
        Navigator.push(context, _createSharedAxisRoute(const CreateGanache()));
      },
      backgroundColor: const Color(0xFFEB8C36),
      foregroundColor: Colors.white,
    );
  }
}

class CreateFlatFab extends StatelessWidget {
  const CreateFlatFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      elevation: 0,
      heroTag: "createGanacheFlat",
      label: const Text("Créer sa ganache"),
      icon: const Icon(Symbols.add),
      onPressed: () {
        HapticFeedback.lightImpact();
        Navigator.push(context, _createSharedAxisRoute(const CreateGanache()));
      },
      backgroundColor: const Color(0xFFEB8C36),
      foregroundColor: Colors.white,
    );
  }
}

class CreateSmallFab extends StatelessWidget {
  const CreateSmallFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      heroTag: "createGanacheSmall",
      backgroundColor: const Color(0xFFEB8C36),
      foregroundColor: Colors.white,
      child: const Icon(Symbols.add),
      onPressed: () {
        HapticFeedback.lightImpact();
        Navigator.push(context, _createSharedAxisRoute(const CreateGanache()));
      },
    );
  }
}

Route _createSharedAxisRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SharedAxisTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        transitionType: SharedAxisTransitionType.scaled, // Effet d'expansion pro
        child: child,
      );
    },
  );
}
