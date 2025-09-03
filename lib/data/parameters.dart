import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../models/list_item.dart';
import '../screens/settings/license_screen.dart';
import '../utils/email_helper.dart';

final items = [
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => LicensePage()),
      );
    },
  ),
];