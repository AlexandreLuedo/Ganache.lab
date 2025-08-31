// Affiche les paramètres
import 'package:flutter/material.dart';
import 'package:ganache_lab/screens/screens_exportation_file.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      // TODO Adding dark theme (SearrchBar class doc)
      // TODO https://docs.flutter.dev/cookbook/persistence/key-value
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // Settings here
            ListTile(
              leading: CircleAvatar(child: Icon(Symbols.info, fill: 1)),
              title: Text('À propos de Ganache.lab'),
              subtitle: Text('En savoir plus sur l\'application'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AboutApplication()),
                );
              },
            ),
            Divider(color: Colors.grey),
            Text(
              ''' Ganache.lab est un calculateur de ganaches ayant pour but d\'équilibrer vos recettes. \n
            © 2025 Hadrien Klotz. Tous droits réservés. L’application Ganache.lab est distribuée sous licence propriétaire. Toute reproduction, modification ou diffusion non autorisée est strictement interdite. En téléchargeant ou en utilisant l’application, vous acceptez les termes de notre contrat de licence.
            ''',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class LicensePageScreen extends StatefulWidget {
  const LicensePageScreen({super.key});

  @override
  _LicensePageScreenState createState() => _LicensePageScreenState();
}

class _LicensePageScreenState extends State<LicensePageScreen> {
  String _licenseText = '';

  @override
  void initState() {
    super.initState();
    _loadLicense();
  }

  Future<void> _loadLicense() async {
    final text = await rootBundle.loadString('assets/licenses/LICENSE.md');
    setState(() {
      _licenseText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('License')),
      body: // SingleChildScrollView(
          Markdown(
        data: _licenseText,
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
// Bloque qui sert à faire le lien pour l'email
void openEmail() async {
  final subject = Uri.encodeComponent('Contact - Application Ganache.lab');
  final body = Uri.encodeComponent('Bonjour,\n Je vous contacte car ');

  final Uri emailUri = Uri.parse('mailto:hadrien.ganache@pm.me?subject=$subject&body=$body');

  if (!await launchUrl(
    emailUri,
    mode: LaunchMode.externalApplication,
  )) {
    print('Impossible d\'ouvrir l\'application mail');
  }
}
// TODO Mauvaise architecture, revoir l'ensemble pour générer des sous catégories avec sens.
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

// Liste pour ajouter les
final items = [
  ListItem(
    leading: CircleAvatar(child: Icon(Symbols.license)),
    title: "Licence",
    subtitle: "Propriétaire",
    isClickable: true,
    onTap: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => LicensePageScreen()),
      );
    },
  ),
  ListItem(
    leading: CircleAvatar(child: Icon(Symbols.mail)),
    title: "Contact",
    subtitle: "hadrien.ganache@pm.me",
    isClickable: true,
    onTap: (context) => openEmail(),
  ),
  ListItem(
    leading: CircleAvatar(child: Icon(Symbols.license)),
    title: "Licences tierces",
    subtitle: "Relatives à chaques paquets employés par l'application",
    isClickable: true,
    onTap: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => LicensePage()),
      );
    },
  ),
];


class AboutApplication extends StatelessWidget {
  const AboutApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              'Ganache',
              style: TextStyle(
                color: Color(0xFF422322),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '.lab',
              style: TextStyle(
                color: Color(0xFFEB8C36),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            VersionPill(),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return ListTile(
                  leading: item.leading,
                  title: Text(item.title),
                  subtitle:
                      item.subtitle.isNotEmpty ? Text(item.subtitle) : null,
                  onTap:
                      item.isClickable ? () => item.onTap?.call(context) : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
