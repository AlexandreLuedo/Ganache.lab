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
  String _glossaryText = "";

  @override
  void initState() {
    super.initState();
    _loadGlossary();
  }

  Future<void> _loadGlossary() async {
    final text = await rootBundle.loadString('assets/documentations/doc.md');
    setState(() {
      _glossaryText = text;
    });
  }

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print("Impossible d’ouvrir $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Glossaire")),
      body: // SingleChildScrollView(
          Markdown(
        data: _glossaryText,
        selectable: true,
        onTapLink: (text, href, title) {
          if (href != null) _openLink(href);
        },
        padding: EdgeInsets.all(16),
        styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
          p: TextStyle(fontSize: 16),
          h1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          h2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      // ),
    );
  }
}
