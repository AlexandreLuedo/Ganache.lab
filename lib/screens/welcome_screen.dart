// Affiche la page principale
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600; // Yes it's dumb
    return Scaffold(
      appBar: AppBar(actions: <Widget>[VersionPill(), GlossaryButton()]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              // #docregion text
              child: Padding(
                padding: EdgeInsets.only(top: 100, bottom: 100),
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
            ),
            CustomContainer(
              borderRadius: 12,
              borderWidth: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Symbols.school, fill: 1),
                      const SizedBox(width: 10),
                      Text(
                        "Comment ça marche ?",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Découvrez l'équilibrage de ganache en trois étapes simples :",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Symbols.grid_view)),
                    title: const Text("1. Les Contraintes", style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text("Définissez le type d'application (Cadre, Moulage) pour déterminer le poids cible."),
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Symbols.cookie)),
                    title: const Text("2. Le Chocolat", style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text("Sélectionnez votre couverture. L'algorithme ajuste les ratios de beurre de cacao et de sucre."),
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Symbols.balance)),
                    title: const Text("3. L'Équilibrage", style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text("Ganache.lab génère instantanément une recette équilibrée (Humidité, Texture, Pouvoir Sucrant)."),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: isMobile ? CreateFab() : null,
    );
  }
}

class AnnouncePageScreen extends StatefulWidget {
  const AnnouncePageScreen({super.key});

  @override
  _AnnouncePageScreenState createState() => _AnnouncePageScreenState();
}

class _AnnouncePageScreenState extends State<AnnouncePageScreen> {
  String _announceText = "";

  @override
  void initState() {
    super.initState();
    _loadAnnounce();
  }

  Future<void> _loadAnnounce() async {
    final text = await rootBundle.loadString('assets/announces/form.md');
    setState(() {
      _announceText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: _announceText,
      padding: EdgeInsets.all(16),
      styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
        p: TextStyle(fontSize: 16),
        h1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        h2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
    // ),
  }
}

class VersionPill extends StatelessWidget {
  const VersionPill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 7, left: 7, top: 2, bottom: 2),
      //height: 10,
      //width: 10,
      decoration: BoxDecoration(
        color: const Color(0xFFEB8C36),
        borderRadius: BorderRadius.circular(100),
      ),
      child: const Row(
        children: [
          Icon(Symbols.experiment, color: Colors.white),
          SizedBox(width: 5),
          Text(
            "Alpha",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
