// Affiche la page principale
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class OnWelcomeScreen extends StatelessWidget {
  const OnWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WelcomeScreen(), floatingActionButton: CreateFab());
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(
      "https://www.microsoft.com/en-us/microsoft-365/online-surveys-polls-quizzes",
    );
    if (!await launchUrl(url)) {
      throw Exception("Impossible d'$url");
    }
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          VersionPill(),
          GlossaryButton(),
        ],
      ),
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
                      Icon(Symbols.assignment, fill: 1),
                      SizedBox(width: 10),
                      Text(
                        "Formulaire",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  // TODO Implémenter ce sâcré form.md
                  Text('''Ce logiciel s’inscrit dans la démarche de mon mémoire pour le BTM Chocolatier‑Confiseur que je prépare.
Mon mémoire porte sur la question suivante : « Comment rendre accessible la création et l’équilibrage de la ganache ».
Pour cela, j’ai besoin d’obtenir des informations et des réponses à différentes questions afin de toucher le plus grand nombre de professionnels possible.
J’ai donc choisi de vous proposer un questionnaire en ligne, facile d’accès et rapide à remplir.
Grâce à votre collaboration, les résultats seront multiples : des données précieuses pour enrichir mon mémoire, un apprentissage personnel sur les besoins des artisans chocolatiers, et un recueil d’idées permettant d’améliorer ce tout‑jeune logiciel.
Je vous remercie vivement pour votre aide et vous invite à cliquer sur le bouton ci‑dessous, qui vous dirigera vers le formulaire.
'''),
                  SizedBox(height: 10),
                  FilledButton.icon(
                    onPressed: () {
                      // Ferme le dialog
                      _launchUrl();
                    },
                    icon: Icon(Symbols.open_in_new),
                    label: const Text("Compléter"),
                    iconAlignment: IconAlignment.end,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
      padding: const EdgeInsets.only(
        right: 7,
        left: 7,
        top: 2,
        bottom: 2,
      ),
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