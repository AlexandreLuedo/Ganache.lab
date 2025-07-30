import 'package:flutter/material.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';

class OnWelcomeScreen extends StatelessWidget {
  const OnWelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeScreen(),
      floatingActionButton: create_fab(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  build(BuildContext context) {
    return const Center(
      // #docregion text
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Bienvenue dans',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ), // #enddocregion text
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ganache',
                style: TextStyle(
                  color: Color(0xFF422322),
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Text(
                '.lab',
                style: TextStyle(
                  color: Color(0xFFEB8C36),
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ], // #enddocregion centered-text
      ),
    );
  }
}