// Système pour affichage d'un glossaire d'informations à destination de l'utilisateur
// Il retourne glossary.md
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class Glossary extends StatefulWidget {
  const Glossary({super.key});

  @override
  _GlossaryState createState() => _GlossaryState();
}

class _GlossaryState extends State<Glossary> {
  String _glossaryText = '';

  @override
  void initState() {
    super.initState();
    _loadGlossary();
  }

  Future<void> _loadGlossary() async {
    final files = [
      'assets/documentations/Welcome.md',
      'assets/documentations/Humidity.md',
      'assets/documentations/DewPoint.md',
      'assets/documentations/SweeteningPower.md',
      'assets/documentations/LifeTime.md',
      'assets/documentations/Footer.md',
    ];

    final texts = await Future.wait(
      files.map((file) => rootBundle.loadString(file)),
    );

    setState(() {
      _glossaryText = texts.join("\n\n"); // concatène tous les textes
    });
  }

  //  final humidity = await rootBundle.loadString('assets/documentations/Humidity.md');
  //  final dewPoint = await rootBundle.loadString('assets/documentations/DewPoint.md');
  //  final sweeteningPower = await rootBundle.loadString('assets/documentations/SweeteningPower.md');
  //  final lifeTime = await rootBundle.loadString('assets/documentations/LifeTime.md');
  //  final footer = await rootBundle.loadString('assets/documentations/Footer.md');
  // final texte = welcome + humidity + dewPoint + sweeteningPower + lifeTime + footer;

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // TODO generate the snackbar
      // SNACKBAR HERE

      print("Impossible d’ouvrir $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Glossaire")),
      // On vérifie si le texte est chargé avant d'afficher le Markdown
      body:
          _glossaryText.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Markdown(
                data: _glossaryText,
                selectable: true,
                onTapLink: (text, href, title) {
                  if (href != null) _openLink(href);
                },
                padding: const EdgeInsets.all(16),
                styleSheet: MarkdownStyleSheet.fromTheme(
                  Theme.of(context),
                ).copyWith(
                  p: const TextStyle(fontSize: 16),
                  h1: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  h2: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
    );
  }
}
