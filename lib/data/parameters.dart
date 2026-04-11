import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ganache_lab/screens/settings/measurement_units.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../models/list_item.dart';
import '../screens/settings/appearence_screen.dart';
import '../utils/email_helper.dart';

/// List of categories on the settings page
final settingsItems = [
  /// About section

  /// Appearance section
  ListItem(
    leading: CircleAvatar(child: Icon(Symbols.format_paint, fill: 1)),
    title: "Apparence",
    subtitle: "Thèmes",
    isClickable: true,
    onTap: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => AppearenceScreen()),
      );
    },
  ),

  /// Measurement unit section
  ListItem(
    leading: CircleAvatar(child: Icon(Symbols.discover_tune, fill: 1)),
    title: "Unités du mesures",
    subtitle: "Température, dimensions, autres unités",
    isClickable: true,
    onTap: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MeasurementUnitsScreen()),
      );
    },
  ),

  /// Application language section
  ListItem(
    leading: CircleAvatar(child: Icon(Symbols.language, fill: 1)),
    title: "Langue de l'application",
    subtitle: "Français",
    isClickable: false,
    onTap: (context) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Placeholder()));
    },
  ),
  ListItem(
    leading: CircleAvatar(child: Icon(Symbols.info, fill: 1)),
    title: "À propos de Ganache.lab",
    subtitle: "En savoir plus sur l'application",
    isClickable: true,
    onTap: (context) {
      showAboutDialog(
        context: context,
        applicationName: "Ganache.lab",
        applicationVersion: "2.0.0",
        applicationLegalese: "© 2026 Alexandre Luedo\nUn logiciel au service des artisans.",
        applicationIcon: Image.asset(
          'assets/icon/Ganache.lab_logo_256.png',
          width: 50,
          height: 50,
        ),
        children: [
          const SizedBox(height: 24),
          FilledButton.icon(
            icon: const Icon(Symbols.mail),
            label: const Text("Me contacter"),
            onPressed: () {
              Navigator.pop(context); // Ferme la boîte de dialogue
              openEmail();
            },
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            icon: const Icon(Symbols.license),
            label: const Text("Licence Ganache.lab"),
            onPressed: () async {
              final licenseText = await rootBundle.loadString('assets/licenses/LICENSE.md');
              if (context.mounted) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    child: DraggableScrollableSheet(
                      initialChildSize: 0.8,
                      minChildSize: 0.5,
                      maxChildSize: 0.95,
                      expand: false,
                      builder: (context, scrollController) {
                        return Column(
                          children: [
                            const SizedBox(height: 8),
                            Container(
                              width: 40,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                "Licence propriétaire",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Markdown(
                                controller: scrollController,
                                data: licenseText,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: FilledButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Fermer"),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ],
      );
    },
  ),
];

final apparenceItems = [
  ListItem(
    leading: CircleAvatar(child: Icon(Symbols.contrast)),
    title: "Thème de l'application",
    subtitle: "Sombre/Clair/Automatique",
    isClickable: false,
    trailing: StatefulBuilder(
      builder: (context, setState) {
        bool isDark = false; // initial value

        return Switch(
          value: isDark,
          onChanged: (value) {
            setState(() {
              isDark = value;
            });
            // Here you could call a Provider, a ThemeMode, etc.
          },
        );
      },
    ),
  ),
];

final measurementsUnitsItems = [
  ListItem(
    leading: CircleAvatar(child: Icon(Symbols.device_thermostat)),
    title: "Unités de température",
    subtitle: "Celsius",
  ),
  ListItem(
    leading: CircleAvatar(child: Icon(Symbols.square_foot)),
    title: "Unité de mesure",
    subtitle: "Cm",
  ),
];