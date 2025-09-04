import 'package:flutter/material.dart';
import 'package:ganache_lab/screens/settings/about_application_screen.dart';
import 'package:ganache_lab/screens/settings/measurement_units.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../models/list_item.dart';
import '../screens/settings/appearence_screen.dart';
import '../screens/settings/license_screen.dart';
import '../utils/email_helper.dart';

final settingsItems = [
  ListItem(
    leading: CircleAvatar(child: Icon(Symbols.info, fill: 1)),
    title: "À propos de Ganache.lab",
    subtitle: "En savoir plus sur l'application",
    isClickable: true,
    onTap: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => AboutApplicationScreen()),
      );
    },
  ),
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
  ListItem(
    leading: CircleAvatar(child: Icon(Symbols.language, fill: 1)),
    title: "Langue de l'application",
    subtitle: "Français",
    isClickable: false,
    onTap: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => Placeholder()),
      );
    },
  ),

];

final aboutItems = [
  ListItem(
    leading: CircleAvatar(child: Icon(Symbols.license)),
    title: "Licence",
    subtitle: "Propriétaire",
    isClickable: true,
    onTap: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => LicenseScreen()),
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
      Navigator.push(context, MaterialPageRoute(builder: (_) => LicensePage()));
    },
  ),
];

final apparenceItems = [
  ListItem(
    leading: CircleAvatar(child: Icon(Symbols.contrast)),
    title: "Thème de l'application",
    subtitle: "Sombre/Clair/Automatique"
  )
];

final measurementsUnitsItems = [
  ListItem(
    leading: CircleAvatar(child: Icon(Symbols.device_thermostat)),
    title: "Unités de température",
    subtitle: "Celsius"
  ),
  ListItem(
    leading: CircleAvatar(child: Icon(Symbols.square_foot)),
    title: "Unité de mesure",
    subtitle: "Cm"
  )
];