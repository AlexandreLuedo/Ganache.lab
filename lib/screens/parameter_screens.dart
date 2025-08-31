// Affiche les paramètres
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';

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
              leading: CircleAvatar(child: Icon(Symbols.info)),
              title: Text("À propos de Ganache.lab"),
              subtitle: Text("En savoir plus sur l'application"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LicensePageScreen()),
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
            ElevatedButton.icon(
              icon: const Icon(Symbols.article),
              label: const Text("Voir la licence"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (_) =>
                            LicensePageScreen(), // LicensePage() ouvre la page des licences
                  ),
                );
              },
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
  String _licenseText = "";

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
      appBar: AppBar(title: Text("License")),
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
