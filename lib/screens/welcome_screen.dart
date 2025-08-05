import 'package:flutter/material.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';
import 'package:ganache_lab/screens/glossary.dart';

class OnWelcomeScreen extends StatelessWidget {
  const OnWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WelcomeScreen(), floatingActionButton: createFab());
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              right: 10,
              left: 10,
              top: 5,
              bottom: 5,
            ),
            //height: 10,
            //width: 10,
            decoration: BoxDecoration(
              color: const Color(0xFFEB8C36),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Row(
              children: [
                Icon(Icons.science_outlined, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  "Alpha",
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Glossary()),
              );
            },
            icon: IconButton(
              color: Theme.of(context).colorScheme.tertiary,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Glossary()),
                );
              },
              icon: const Icon(Icons.book_outlined),
            ),
          ),
        ],
      ),
      body: Center(
        // #docregion text
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Bienvenue dans \n',
            style: TextStyle(fontSize: 20, color: Colors.grey),
            children: const <TextSpan>[
              TextSpan(
                text: 'Ganache',
                style: TextStyle(
                  color: Color(0xFF422322),
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              TextSpan(
                text: '.lab',
                style: TextStyle(
                  color: Color(0xFFEB8C36),
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
